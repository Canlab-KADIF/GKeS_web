String snakeToTitleCase(String input) {
    return input
        .split('_')                                            // '_'로 나눔
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}')  // 각 단어 첫 글자 대문자
        .join(' ');                                            // 공백으로 결합
}