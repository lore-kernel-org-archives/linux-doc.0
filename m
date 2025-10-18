Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF8626D4CD
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760792685; cv=none; b=NHDjBEW/L9zf/OgpVD0hVS3dD7ALZKN95x/TNyCo9Qr+EOP+ItKdzsaHAWC4GnDeIWzvsdiUzifNVFccsHb2LQvPceHZxW+8rWIr9ijdFbMVKK9jycISuUh3nbrijEThKK59JvsuOz68LCF+ChTJrLEEjPf1ML7PhhvGsorHDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760792685; c=relaxed/simple;
	bh=R+KaKUoTMbS3qGkwBTJDmbjeQcTDbiGE1Vr8NkGkL/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdFPP17APrgopc7RRHSsMlvha7iWEExYlKT2BrQ3Sd8KdAJfTkPvc+iWqmYzUQjRj6fImnQ46izK09hzG8gCEOro7ShNNzOCgbjn7X3LeVoS02agg0/xdoQg8aB9FCKDOmz7dttPhUVaaxsqOrbeWpEBWaavimmxCkGeEbI5Mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxgQBC/a; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxgQBC/a"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-7960d69f14bso24620636d6.2
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760792682; x=1761397482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trCRqXRfBn/yxKdZHJTPwmyQCvgYCCi0gPBNAdqxdVM=;
        b=bxgQBC/a2DjERNkm7/nDtx1+7oZElydCVRwThzApZ9S81f5WJrC/iS7XOzONDxn/XI
         yPKpGl2pbOiyr+v1yJHJW1TeDH/A7CcyJlGOj0zHAh/HuaDzIEThTvxh1Ck8zu3X0KxV
         XaTcik3kXkBhp0YnU0cuntz9IivyhLlULDz4m61kGNKOyMASCjOGGOZMMqapznsbn5VM
         U9d9Pn4VxEqYSIIgJumlslpWibxow1ee+sZ2a2SkjfvVBo6CtViXLKztM2W8C/e9qRa5
         K3uSSCZa8qiCRETmW1hUPqwppISNwUNhCIHUKx8byZjLjqGUuVvC4iCOwPF+REx0TyAw
         ZOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760792682; x=1761397482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trCRqXRfBn/yxKdZHJTPwmyQCvgYCCi0gPBNAdqxdVM=;
        b=oZfkm6PzPvJTTDd3cIdlZxjz394iWKscYWC3LOpOcTwjGjVbFXqZb2MHIawD2L0j8o
         pzA+skj3XyXfRfvSN+xeccP6KyRo5gb7dF12+vfmmEaQKOYTOTgMI7A0mAALKKGivfRv
         cw9qeL3pgzYXLuqqGPKGheMBXfMMMLlUpS5LMC34FnVYZHSOQVHlqhLUuxHYiYJV7lEx
         N5ovU8OZzksYrBb3ZsOjT1FBT3iMIQUr1ILJbSCG8yM2b+FKXC4IR7nrKu52MSrYs9+q
         y24T+DoXFDXidN9FjJFoxEbN/iggpOkwpZS3k/i7JiClYPjadlxkYVkLXC7j6VwRwQFD
         dZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkkXXL1CwxsrVxZJw9Rc7tmkswlqbpQBleo2lyBi7KzgEGCM7BihUmdSp26odVuhbtTxgeGjy32qU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpe7NU0JwB9jEZVQvrBJchQ9XNPJrF9egkmugvJUIka1EzH7oM
	c1cT31hGm6X3YCAQ7MrDE5olamI/9Wajla++tbu8W5kJvMBm7kZQTbkOumJENSzI
X-Gm-Gg: ASbGncuK0+15k1C+r/Dgs7O93MJpPwLxI+1HIawoDPPKvPNIMjZ5b4pKtRxb0xQh8RX
	uRq9iR0FJlwOID1NM04A9CvP8L0OnVvTgA9FpCiQBd8RAa6+mMAZPfw1JgX7lJ7XRGtL8AaCyjh
	z6riEiNxD8uRzhiwSP8Vsc4Okf8am93qOxX0dQDxx+Xw+4t764fqihBy1FgF6l5c8+1fxr1EcXL
	yqBbN1HMYj4SvT7CJrJsC08mZK58swJQKTwAY5hpnDboQuIXVm4jbxhYBC1JqUlXHZXsCGutd30
	3asVv/JVBFxarJLIWzZ5i/ySq7WQQTasofQHzo9ONeAHs6zgS/n0N43e3AGKQWi3+N7ubC1fNyD
	W0Xi0IimyZiBT3+Egw6LVt+C34/e1CvDAq4oysTWuyNbGQinnFdWnpS01uN/DCOAKYmKJZ4GsAA
	FRv7AxImoinhRnvieipfpmAAfRkFPKCqu8z7Rq
X-Google-Smtp-Source: AGHT+IE7kX32IxJFAb9JSe9/i8fvfeClIEH20D/LplyGFeMenVVt53YG8UVPIv0JZpwN4q0Ac2LjXQ==
X-Received: by 2002:a05:6214:5287:b0:87c:d60:1017 with SMTP id 6a1803df08f44-87c2057f338mr107476366d6.21.1760792682181;
        Sat, 18 Oct 2025 06:04:42 -0700 (PDT)
Received: from ideapad.mynetworksettings.com ([2600:4040:5304:d300:275f:6229:da5:6a60])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028966fasm15840596d6.33.2025.10.18.06.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:04:41 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: rostedt@goodmis.org,
	tglozar@redhat.com,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>
Subject: [PATCH v4 0/2] rtla: fix cgroup and trace options parsing
Date: Sat, 18 Oct 2025 09:04:29 -0400
Message-ID: <cover.1760791697.git.ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes 2 issue in rtla timerlat and osnoise parsing.

1. Make -C/--cgroup option more user-friendly. Currently rtla timerlat
   and osnoise parses does not allow to specify tracer's threads cgroup
   name as `-C [cgroup]` or `--cgroup [cgroup]`. Second patch fixes this
   by allowing users to specify cgroup in the aforementioned manner.

2. When specifying `-t/--trace` before `-a/--auto`, trace filename is
   override to default <osnoise|timerlat>_trace.txt. For example, when
   running rtla as

       `rtla timerlat top -t custom_file.txt -a 100`

   when the threshold is reached, timerlat_trace.txt file is created
   instead of specified custom_file.txt. Third patch addresses this
   issue.

changes v3 -> v4:
   - Removed patch [1] as it has been mainlined
   - Resolved merge conflicts with [2]

changes v2 -> v3:
   - Combined common logic into a utility function to parse optional
     argument value
   - Removed change that removed `clear_terminal` 

changes v1 -> v2:
   - Moved removing clear_terminal from `fix -C/--cgroup interface`
     patch to `fix -a overriding -t argument` patch
   - Added clarification why to remove clear_terminal
   - Added `Fixes:` tag to the `fix -C/--cgroup interface` patch

v3: https://lore.kernel.org/all/cover.1757034919.git.ipravdin.official@gmail.com/
v2: https://lore.kernel.org/all/cover.1755018581.git.ipravdin.official@gmail.com/
v1: https://lore.kernel.org/all/cover.1755014784.git.ipravdin.official@gmail.com/

[1] https://lore.kernel.org/all/164ffc2ec8edacaf1295789dad82a07817b6263d.1757034919.git.ipravdin.official@gmail.com/
[2] https://patchwork.kernel.org/project/linux-trace-kernel/list/?series=999703

Ivan Pravdin (2):
  rtla: fix -C/--cgroup interface
  rtla: fix -a overriding -t argument

 Documentation/tools/rtla/common_options.rst |  2 +-
 tools/tracing/rtla/src/osnoise_hist.c       | 29 +++++++--------------
 tools/tracing/rtla/src/osnoise_top.c        | 28 +++++++-------------
 tools/tracing/rtla/src/timerlat_hist.c      | 29 +++++++--------------
 tools/tracing/rtla/src/timerlat_top.c       | 29 +++++++--------------
 tools/tracing/rtla/src/utils.c              | 26 ++++++++++++++++++
 tools/tracing/rtla/src/utils.h              |  1 +
 7 files changed, 64 insertions(+), 80 deletions(-)

-- 
2.48.1

