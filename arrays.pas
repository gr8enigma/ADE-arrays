PROGRAM arrays;


CONST
  n = 10;

TYPE
  ArrayType = ARRAY [1..n] OF INTEGER;

PROCEDURE RotateArray(VAR arr: ArrayType; rotateBy, arraySize: INTEGER);
VAR
  store, replace: INTEGER;
  i, j: INTEGER;
BEGIN
  IF (arraySize > 1) AND (rotateBy > 0) THEN BEGIN
    j := 1;
    WHILE j <= rotateBy DO BEGIN
      store := arr[1];
      replace := arr[2];
      i := 1;
      WHILE i <= arraySize DO BEGIN
        IF ((i + 1) MOD arraySize = 0) THEN
          arr[i + 1] := store
        ELSE
          arr[(i + 1) MOD arraySize] := store;
        store := replace;
        i := i + 1;
        IF ((i + 1) MOD arraySize = 0) THEN
          replace := arr[(i + 1)]
        ELSE
          replace := arr[(i + 1) MOD arraySize];
      END;
      j := j + 1;
    END;
  END;
END;


PROCEDURE RotateArrayBetter(VAR arr: ArrayType; rotateBy, arraySize: INTEGER);
VAR
  last: INTEGER;
  i, j: INTEGER;
BEGIN
  IF (arraySize > 1) AND (rotateBy > 0) THEN BEGIN
    j := 1;
    WHILE j <= rotateBy DO BEGIN
      last := arr[n];
      i := n;
      WHILE i > 1 DO BEGIN
        arr[i] := arr[i-1];
        i := i - 1;
      END;
      arr[1] := last;
      j := j + 1;
    END;
  END;
END;


FUNCTION Distance(arr: ARRAY OF INTEGER; x: INTEGER): INTEGER;
VAR
  amountXFound: INTEGER;
  i: INTEGER;
BEGIN
  i := Low(arr);
  amountXFound := 0;
  Distance := 0;
  WHILE (i <= High(arr)) AND (amountXFound < 2) DO BEGIN
    IF amountXFound > 0 THEN
      Distance := Distance + 1;
    IF arr[i] = x THEN
      amountXFound := amountXFound + 1;
    i := i + 1;
  END;
  IF amountXFound = 1 THEN
    Distance := 0;
END;


PROCEDURE Unique(VAR arr: ARRAY OF INTEGER);
VAR
  i, j: INTEGER;
  shiftCounter, clearedFields: INTEGER;
  stop: BOOLEAN;
BEGIN
  clearedFields := 0;
  i := Low(arr);
  WriteLn(High(arr));
  stop := FALSE;
  WHILE (i < High(arr)) AND (NOT stop) DO BEGIN
    IF arr[i] > arr [i + 1] THEN
      stop := TRUE;
    IF arr[i] = arr[i + 1] THEN BEGIN
      shiftCounter := High(arr) - i;
      j := i;
      WHILE shiftCounter > 0 DO BEGIN
        arr[j] := arr[j + 1];
        j := j + 1;
        shiftCounter := shiftCounter - 1;
      END;
      arr[High(arr) - clearedFields] := 0;
      clearedFields := clearedFields + 1;
    END
    ELSE BEGIN
      i := i + 1;
      WriteLn(i);
      WriteLn(High(arr));
    END;
  END;
END;






PROCEDURE FillArray(VAR arr: ARRAY OF INTEGER);
VAR
  i: INTEGER;
BEGIN
  Randomize;
  FOR i := Low(arr) TO High(arr) DO
    arr[i] := Random(32767);
END;
// WriteArray siehe unten

// FUNCTION IsSorted(arr: ARRAY OF INTEGER): BOOLEAN;
// VAR
//   i: INTEGER;
// BEGIN
//   i := Low(arr);
//   IsSorted := TRUE;
//   WHILE (i < High(arr)) AND IsSorted DO BEGIN
//     isSorted := arr[i] <= arr[i + 1];
//     i := i + 1;
//   END;
// END;

FUNCTION IsSortedV2(arr: ARRAY OF INTEGER): BOOLEAN;
VAR
  i: INTEGER;
BEGIN
  i := Low(arr);
  IsSortedV2 := TRUE;
  WHILE (i < High(arr)) AND (arr[i] <= arr[i + 1]) DO
    i := i + 1;
  IsSortedV2 := arr[i] <= arr[i + 1];
END;




VAR
  testArray1: ArrayType = (0, 0, 2, 3, 3, 3, 6, 7, 8, 8);
  testArray2: ArrayType;
  runner: INTEGER;
BEGIN
  // FOR runner := Low(testArray1) TO Length(testArray1) DO
  //   Write(testArray1[runner], ', ');


  // WriteLn;
  // RotateArrayBetter(testArray1, 2, n);
  // FOR runner := 1 TO n DO
  //   Write(testArray1[runner], ', ')
  // WriteLn(Distance(testArray1, 8)); // 1
  // WriteLn(Distance(testArray1, 0)); // 0
  // WriteLn(Distance(testArray1, 3)); // 2
  // WriteLn(Distance(testArray1, 2)); // 7

  Unique(testArray1);
  FOR runner := Low(testArray1) TO High(testArray1) DO
     Write(testArray1[runner], ', ');
  // FillArray(testArray2);
  // FOR runner := Low(testArray2) TO High(testArray2) DO
  //   Write(testArray2[runner], ', ');
  // WriteLn(IsSortedV2(testArray1));
END.




