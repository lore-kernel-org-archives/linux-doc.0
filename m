Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621750;
	b=YpoUKEejNDhyhgDAJgnIHpsz+hN/fjlfVR3/q46wXTESDrBuhiYQp+pdBT6As1zK9cSR
	 SeWm/7OpzKm0JqATK/yKaj/SA4ghGxy+CrP/zZcW21kY/QMXbXMXHFSiWoEdoJX5YbzO8
	 JqYDYkX4Pg6+OIoUPo1e5zMEZkv0W+I5caEt8tJ0aOzZ1yN/b6BHe6/JvrAiN01bc6rKz
	 X0YSEgSKPyaIGUHwbtdsRYyPUzx/c1JN/I8dm7w2L5fTur8DJJ8n7SWfDhPDoc2mOiGeP
	 Z0N3+R2PMLiDx1r20TVWUE5W5KB7feDQERnlbb34IpXWL4CKP5gi75pVSXSgGn6VGoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
	b=4tg9o//250HLsCxrPj4GJ3QrKCzZ4lJ4XrtVyqML2gEEx+eneblSm5pnntN8DATAancx
	 XeLqrh/S+bNpIpgYuJocl4wmS2hZJBakI62P/zOT00j5PyQyTpgL1HzQ0s1fLmzVRA4NU
	 c1v4X+iNSHjHZPGgTuM3REfRujUp0E0wORavEnxIu+ZM4HSGkzZ/XuCyQNbP7pqthS+tF
	 W7BmVtWMHJaC8weyKBAE4D28ZZTNqKgGLgh7vp7P2w9lJ5PCezvPOtsOqZ/Jpl1iW8gZZ
	 2WkIeez0OAZ2yCl7PvZ3D0oXY1uvxX/bfGvImLieA035iXrEMcSWFSiEe8X8GCNiwRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jAyjX8Rj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D34A606A331
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D34A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jAyjX8Rj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18446715e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621749; x=1794226549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=jAyjX8RjikbSFOz5r/4iZSr/XrWjeb8swvY9HDzvFD1DH8Kntoq8ZhuLVTIVkUl2MB
         FWoArT1ZtuATqoAEhlSo7JGby6VeNVxrowZrXhz5PMqHnriraQRM7poLHdwu4wKNeHzz
         cUbEdWg+qVQsum2j+4tW8aTNKNxosI1P0+Y/Jlz0Fb+gVTIEZ93CscZ5tHnujXeux3yq
         i8RZJrj0piV5/3CWkQHFo+lxJ65Rh8TtRlCnA8ftaZDtrHYNtoytBuoGuF8Akc5Y9pQx
         J40nLhmsQ1QpO+GYecxtag2hBmA7JWsH588DsFKM3WJX7PfxI/jumvJWdfGJ3tqjvXje
         DhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621749; x=1794226549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kx5q/BQBwUxVzCJruBUh0184bcctd1FMQSl+tIj0LU=;
        b=ESdSnRwAPvdNqUGD4snAHI3+lp7nTRy96RBvB9mHtBugVBpdMfW3o4KZ9fskfI657L
         boZ4lypX7NdnoJCcYJ85wPscOzDVtVPNCheTGi9/xaR70bGOwZhi/ibj+a1ydHRUliC7
         pQFbFBJkUpMYhQ1wjU3o9eWbFUHM+2FobwNJJJ11Yj18FTWXvpMjIUuTcX/GVh3x7rFU
         +bqh4jbK9ocF86RYAJv2XpKcy8p14myhGgOVe4Z/2G8QWZuHBnuk4Fc9KgFZOffmdfBN
         1RKDhH2nj5i0rx0n054y9qyQWuh2awaXtv5QkzhGLzsL4owWbgdOFp4CnhMmhyzLUlr2
         6Wlw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZhXaI00LYn8WjOKL20SUZ4pPm0NaI0Y28L74beZU65Dg0AvmtTp5SxOljMh5Zo7Jkv3XncRGCEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7RPcCHEhVtn9b2dJozgCZ9R2ToF/ZR6U/hkHgTHovtjIbpx+E
	JuDRpyPomziv1CV+RvD+wPJJz1IwRJeYocrJwnN+I3Ux1S/OTPzZfSZpkmtz6iqtcCM=
X-Gm-Gg: AYBFou3hdK7hrc3ILBTkHnYad8DqARheXF2CdHA2FgfslD2c4Lf5unuCxLq2nYZtGxe
	VePsAAyzSwIoiU5nZ+g8N4px/j1KmXBEh2KpglaiygrexszIQyZHMoEP+SS92H4WQoJ4+Ra6jG4
	C06vwKXZcFXeCpOjvxUdGIDPF8JJ77iio0fGiqgEzNSwUcdy1HxTTCJLXMx1/F9+CoOYMKOrAOg
	9xSxJIlJAzbBM7bBlQxmfKLh5twy+N+NZm1J3yyhMGhLOz6uslsNx9Yc3eYS7LOZd00ultGyTs8
	edERpnkXECWtnU24nxJWvtuG8rsEz5KjYR3Dh9XTIUfQoMUfd0qW1AN4FxUlSlAAT4u/tqtDYoR
	DbxYR3Egfs6MEYJGXrP/f6Or0KfCzHb/YrZQvOi+KCOE7qaPHYbSdxTRD6kJQqySQdQ6FAvlNLI
	h0dnGCIdo3XbzX8ETCmwUYLUh4Ft8ZeYH/Z/knhjp4C1J9o3juLXnrbwQeF8CXwNul3bxp5k8Pc
	njhTNCJXJkDPtyH6Kwrib7MKDrxNdeFjCzZcAxBbaQDlGa4jGvUo14ueeEwshDvFNxt8H7GXC60
	QAkhAbbAd24UomvJcpUqBXu4Mb1/3Ofd
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4ac16acfbd0mr207623275e9.7.1793621748831;
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:19 +0000
Subject: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

When we increase the default timestamp interval in a later commit, less
trace will be recorded. At the moment the amount of trace overflows the
64K buffer, so the exit snapshot trace is what happened at the end of
the process rather than the beginning. With the new default interval,
the entire execution will be contained in one buffer and the first few
samples are always various instruction and data faults. These go to the
kernel so don't result in ranges that can be disassembled.

Increase the window to 6 samples to ensure something with a branch can
be disassembled even with the fault samples.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index d298b18154b2..236c4160e480 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -50,7 +50,7 @@ if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
-		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -62,7 +62,7 @@ fi
 echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
-	-d --stop-sample=2 2> /dev/null > ${file}
+	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.43.0

