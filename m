Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621755;
	b=cZWcPthtDpWx6RqqdHt63/TddC5ueO3+ykkL1JfUVtwOwou/6D5+cuJqw7WvfvbdesDO
	 ZgN1zcxBubWwWlZDycUMIqy+ZVyamtISvuNGmFubQQa71YusrQBN1e1rSixP0UkLhwSZZ
	 fC1znw8IqvngmVruSz32YUucEkJLbEDo7nftMOLudt7/JBMg6FxHtp8QzD/aPec0Bjta+
	 imZ1RtyqdUhu9Kgd45jVikQAT2dKP/xDY6/vrK9QUqtvHsV4t7zpNMgrwyU2qCPt9/Ozr
	 75LFgGc9BS2Vy0mU6aEmbEzjPdmWaOlJJEepLRgWR7oxYDj6BKCk4Uvxq1fPDgrGyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
	b=kAW6YFeA/9S2WHBu8aottxASjKXsQteCkDBFsfy+uYm8jrN/Vxl0e4wXa/Qwa+eERY4V
	 knNN2eg89RQdtf2U2q2s/4o72FxAUhLyfFKjjN9qpZ9Y1aTKfPouoyiCCZhGZUxWAM7yo
	 R7COYNJ22mXI+1qD8RqwoY/UlQDK1b4OiM5yZS4rscJRFx+sFM1pM4i0aKXtFFsW0gyGO
	 C3Cg7UYoxvJBPTg0Ao8+dVC3/4ixhfLf2EZDJbOu54dQulUYdsOKaTctnWVjxnmUokK7F
	 8kPnDws53oJC2y35IK5oT5gRGXg3g1ghoyMTUk63j7rFA+wT6YlAfB5+f3+hMN76zKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYZuwm4i;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD060A3836
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FAD060A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jYZuwm4i
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25263155e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621754; x=1794226554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=jYZuwm4iKSkQfz8VriuCw5G+4HqM5DpQwNMCAhfmyMQBm+b9/ypIreMw1vR1AwMyjY
         njYOGwK91dVT1jVmUM2chqMZy8mC6qnwipKHRsCRFg9kc4qNsAo52O5d8Ld2/ArA41tj
         8MZiiaa4OSsIHDefjEt3MGzdBtSdafTuU6Uhxvrt12CM1sHS3f2BjinZXuYn0ZZuez4f
         2r9lIvkFc8HQ+a8JdaWJsIU2NVZOyf8hdpj+ctz1J5ObmH/LF6hWUndZeR7XvS7gKbYP
         K/2XA7u5r71NjplD8x8jjZZW6GOVIo4WzSqUT0U7nPeGmumvMeFnZDxmK2t817ImzKKV
         UFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621754; x=1794226554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWyhBgnl5ljVt2Vm8I0njJJDAjJXWTVLrBozwNDgUng=;
        b=UVVHtTksg89badXMAhNcnlSSg7uK1DDeD+REWnqBUwkxRNqAPY8basUafVMo6kpLv1
         ZtOSl9XS3aNx6Y5F/W0+RsQo4evJBzqvF+b4XeBOSpTotEn0BD+moMXczGMq+TyPLiX7
         UaAPy8ZrJnUHpg/VwZrCp5a8hteH9U+Y7r3FF9MOaiKOq2UBdNoSfJOA1L7VbmMOJvJ+
         jV61hPfIFyawK+iFqAr+lRFFHwFYG1aNkrwwPPpzAlGodFWq9L8Dmd4ynNAvaxshsPlW
         hkIVQmHWWUiynCWEVJJCSIFYpNn+Uutuu8SLCACrIc7XMGlyB7y9FjUYSzRjXknnby0D
         Bsvw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Do9Ymj4yx2ghcLSt3h5RMrBWpDGh6eOWqdJ33OVuncR/IePY4tlWs1IgMGqh0Q/1up+jF/CrXuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfP/GKgEevZQquxUZzwKz2fSOOO5PYsbCCXItZh+9l1sF99VrT
	zuCQuaDHF0R/PsyQa8aqiub8Q9X+nQKIdPy2a8KAEwxeIKpzVD+9P7KafZ0OQPXrDt8=
X-Gm-Gg: AYBFou0/m/Xamm1Qc1+VOt/4Idf/xfOVASfvA5xTJDExwf0Wx/RNEBIDq7EpzTxZStb
	kSRx1RG8TwPIW17koxdEQ1Dmklny8eSzhGpmgiKKTKTBhzHwvn+KVnFsCdtaAMESbBZdg3zABSN
	er197kEaaTkUpvKgKWBwsscOq9EEZMvo5LQ6sQur1tbWh01jScOEsbd5NDFLWQQceV9VyebEzlR
	uLkSbEFqfItUPfKefYt9V248H/cHedVKFmD88W/xODJWdv42m/P/KiQcolZJuutvusvcWAHyRMl
	X2wMkVVAGQGsyFzDeamDLg52KomhUM/qSxSoyS9VSEbVWTJr9a6PxI8KQ1+0uacin79M2zcBXh0
	tDBC6evAGuvVsp+WQAWbicqzGXhP67DetpkeN8O1BQReC80M69vmRijB/flNXRV3g+TfRqCzCsQ
	QZBWsKbtHSetbmiQOvRyAo5AN7SlqGDQI5U3J1kbd0GSiYzwQNvNIRgAYk4maNYKvDlBLQJ+wBQ
	fn22Bnn06BarQwnqmR03FUilHFhazdgzCU2l4aqCzxPu+LaQpIdHwcr22YfVSwriP/CGXKU1Tf3
	v4ZWExP/GMK8xeMfhBLugGNlhatmCwvp
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr93551315e9.14.1793621753669;
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:22 +0000
Subject: [PATCH v3 08/18] perf cs-etm: Use instruction length in
 disassembly script
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-8-dbcb0c281b9b@linaro.org>
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

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0

