Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608EA436361
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015508; cv=none; b=bWR7rZjeJVrpbTbZVKxLYp+iFkQhdLdWyNRJY6RMDwEfLcHrSUfWcANQjmV3ho5Q8Io7rf+a1KNfUXWZ/XRKTo+FSTkxvHXoAqlNitNHHyqFPO8vzT7wGX+McQVNDZ+Yz5r8wPpyAfMhyRJMJxhomBRljg8qtjmXkMvAnZfhNG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015508; c=relaxed/simple;
	bh=QxiXQQoGhuE0v0FKgjfs2qmeul36mpIzc28JU+Z4ydA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLuAMkSXvxponPOrYrJN4XP0DYiDX2S1Nn/G1UoBEBSdBjpMVKksxv5NzIL9XsD/MPAa0SEkiNJeOpgIJUJ654PTvbLsYNWXYCt6YjJabXIsYVQyqH+444LoYlJAwABC5A/UsBIQ1a4NvEDJRBcBhaw1tXdyAhdMm1zDAef2LAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyJIqsnT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyJIqsnT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so3911597f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015504; x=1781620304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIDogTCAxtWe2C3a6zQaBCMJ4/zJw46qDk4EjlSKYTU=;
        b=lyJIqsnTLhINBOBYBMZze30na+/+5fPXRtTvyetY7C/pG0ncmJ/jkocnV5DT+hyKo+
         HO18hCJVnSB2Mo4pK3lJJf+18Yk4gOeQcCCRKEGf7+1DVOxK1Mg+9hb56DKGR1lDJWpO
         OkbZ3/tOFckTQTs0ioC7ebSPxFMRN9fd2eKfIUNg7sG+EOFdmQovMStBsUX9HASdiQd2
         YLcXMyGKmxG/n5plXVRZ9KD2b/LopmZIuYcLHkQ3gnJdm/Wi0sn9+pNNYkNqHenct2Pu
         7uCkZK5pHuAOcW+k+DT+ROz9HIZBZP12L9mIAs7emx4Yd1u8vS/T7ElpmX3KSqvYKrgS
         3LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015504; x=1781620304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIDogTCAxtWe2C3a6zQaBCMJ4/zJw46qDk4EjlSKYTU=;
        b=f9UKdU5Zc4miQJFL8Z5H6PauKB/QN2dXbEAgV2jN9kZ3vw7pU7Ho4ktB5yb4aaCau7
         O5roggU8dMKYAdHQkvvNNURhhMowyXFhW3zKGd8DKnxvDDSrFneyo83I8Dgi4y4fLOyv
         /zLsJbFZr/uvbIF2mhLrteJomyZsohD7t85ChvEeV5cczyUz7R9U4054rff4hy1TyhLT
         YkLjc3J7S6xmjgj0TWENd6DuBsOcO7aEx0HUgkqn4lUFE4a0lYXRcnuJlXBVHdJDjxqH
         Nur3IFmSSuNllCnLT/ccAZnQ9gB+cLoOjAOdZo5rr3SdVCkOEOlRUryfashqvwDIMHyD
         bKKA==
X-Forwarded-Encrypted: i=1; AFNElJ9rDy+nxNqpW7Kfs5RAtqr1bCfx9BdyUuLi6KW5h7EKzNvTWRYsIUuGf7GoLE5wQZj2fAAW+AgjVBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxJYSwYcsDvd0/+yIFpLNrRh9LbaF382A3Nw1RBdsZDSzqigB
	YSvSrweDKH2MDIWBLNOF/LJX89eTUTQyehMDD8XfvHL2RYCCWpZxG+yW1RSEnO9XmFSeTADhb74
	g7cBBh9I=
X-Gm-Gg: Acq92OFmPye4CZN6J+bJmGN63HGJN1kMFNUFkzNtdLF6H/Ic7xB0QuK7Piq83PQ0aGH
	lsH4d3ff4hI0W2QS6a7Ja1V+/Z8Y3UR5NiS8v9qbC9Yqvrm3msvQlkizWSZED8eZ5JouIE0Fw9O
	Z6KjuEO4wpSyZKB7+0l7NJ8qQNueWQwakpy6rcHB1lL2ki7ZfN5r+2LtIvZda/EveRyv0xBlRW8
	kFmDcCoDwKtHALqjv55HPwLWI8OJFg7jJhDcU6alxAcnA0a/6f6AUdAUridn2cRUMHk4gY/elxb
	Jwzf+ZeVN5YVvCmvUkP5HTldv9chq3IKkEtnEIKu9EXyaVf6Y5+ga4AE4bWJuV06/9066ecmuoW
	qxczzgLAXXjjcdMV0o4HoGvkJMJv9KmAtewEhamd6Enkn/GK44QiMp7xnobrxAPgCDvOVLBP7IU
	ylLZhaMkMLt3rByzPQPjPoKHygKC1NyxgDz5yaMYjOk7U=
X-Received: by 2002:a05:6000:4802:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-46032b611d3mr31298701f8f.3.1781015503869;
        Tue, 09 Jun 2026 07:31:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:11 +0100
Subject: [PATCH v4 18/19] perf test cs-etm: Speed up disassembly test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-18-44f9fb9e5c42@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

We can use exit snapshot to limit the amount of trace to decode here
too. Also each call to objdump is quite expensive on kcore so limit it
to 2 samples instead of 30. We only want to see if there is no data at
all.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index f78dfb6bf73e..f2fb1aa92252 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -43,9 +43,9 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
-		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -55,9 +55,9 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
-	-d --stop-sample=30 2> /dev/null > ${file}
+	-d --stop-sample=2 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.34.1

