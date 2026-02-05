Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB1B3E9F82
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299928; cv=none; b=XUieTo+ByKlEI9xdVqMezfABmoy2loFaRPqJrIntUqeXTeXrbB9jbB7NwlXZJHdZabmk30b5i6Jy9egym39JNwBsy7JSURg43RpxQ7gqnI+D8PRTd6oKvziDwzOho3LflMgfnL73ZzhiyzGyVgnS/b+P0L+2Fp5ua3L7lvivgO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299928; c=relaxed/simple;
	bh=E4HFJMThakiyZ3PNDQdEq1HCxaDForK49Da5ZoVfT3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJeWiMjGCjhVqAxxBm90+QFi9GPz1WXwxBm0DFz5FVB7pIQYCpfhdZpb+iTAe21BWEzM4cEHdRwX+kn0i75JJHn3nBLJPmK5FAJIgcsdZOsCIvKIKKmN5uzRn4i3eR4K0IFb6F5exmWIGAH8/kkl688OqxOg/1Dt4kq1Hu1DlRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWKingNP; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWKingNP"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ca3807494eso60932185a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770299927; x=1770904727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSpavQGrbW9Sk1NhHLCmCOMh7WCFB8hsxDAgv+wU+rk=;
        b=CWKingNP+Qtnyr8iyFrjElg98FlHwRcI9yu3xSF+kPA0jJ2v2uePllJVV2VyCrVidW
         SM04oyW7ifsuu36YDEocnlUj7vMW1HVnFuicYtIGViWdUbVVrfPkqnxx2+FZgtxXi326
         QHtB3wYgNcF1AtaE9Dk8aCGvk/9/td6BkLhdvXpFtcu5SZrKZ2gHEuP+w3eY0pAunieh
         0guo31hDLF9gJ/KmvrTRMjqrBvUi7G+Z1l+FpfzGv1fazeqBcF5xBwr8g2euiRP++vmx
         0T49yOwkXNkdiDRXQKElWcauFsGqQHJSW5EC+tH3UfMGF+OiTfFUi8YXqNOLZT4GJbVg
         239g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299927; x=1770904727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSpavQGrbW9Sk1NhHLCmCOMh7WCFB8hsxDAgv+wU+rk=;
        b=OoAiNUbr1+Q3ODEZNJB0Z+TMpdyNPE2HuDyD6RhoDtCiObWK+SyNqFyy3dlfa4tNkr
         jl6koJo8g1KfZxvDUIQgho9hJhkLE9AbLOt+DP18WkoMHaRESsxWDh2wmoe6Yzo6Bw0q
         f/yxVJN/BoYwk2/csSrE+s34PjYZbt7hVSwrqS+M2YFrU334Y8OraPhsLAHesO7PFuRc
         tvhnunYXcdipoSicc3yCwj/I/hZB8BG7uGeg0kOZp77Qth2kyXa5Msf9jC7K9IQkAOio
         KHrn/7y7WGQrmTF/vbYz3/Y71msBMNOvVIhu8xhPiLCLpkIZKTa4MGsjxsxsda5q6G82
         Vh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGrYhPYIJ7vtxmmjQm3SIKs6KyRrbZoufTuAWh6tTQDViPwl0kzwsWzjjDtxpymTlg9+SXnzsR+vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypGF9DD3xQpr270o4F6c7NWkbMfE/EK5ZEqujHROeU9+FBFTQ0
	N5cNa1ChTQ+b8zBdaw6iULCbkF5EsIOwRkd3yI+Xi5kePzZy9m/n6Y09OY0+tw==
X-Gm-Gg: AZuq6aKihnonuREFqv+a4/g2jwwpVlqzHJt+S30xxP1kF26JbZ6BqqUY01AVqqI4z3y
	FDhO6+kA3w5RtsVrdoRksxNUDv7mk1hmXAtHJj002Ge2mhNf8l02k6qy7+/sriSt6lJuBWMK9X4
	6rcu96nNlXOYiTHpAsPhxtrq/mW44xC6venXTAw6HFWKXIMrPI8DTJcEa3mWfzRmkypNdDVvmZn
	IE1jEeudQ8D4FgwkRe+IF+i5MFlSUJSFWp+QpDdi0neVKHv4lSP9dtPn2owf1/Dc9JyGqrepsU6
	7AkMeHR3cdVt81zzn0bMXBI/3vVUKiMvi82FOej0tSnmQmvgeC2Ll3YkBrEDykoEtXtLVWCxJdO
	dcjRd7gd+o6riLmgxNRqX4PoEgM0SgfDttGGw9HV+C7pBONUbp2brlAv3PVbuv1FIOu6RSJdDcy
	00uRAkJ/jngMHLh/hzqX8I4jTs4CmQW9IDcVX05fiIPQF49e7L3iXmhesgJsXrDdmoQg2os1J3g
	b/7ysWkJQ==
X-Received: by 2002:a05:620a:4146:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8ca2f9bb02emr906508885a.43.1770299926871;
        Thu, 05 Feb 2026 05:58:46 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:87a6:ecbb:44f:b3c1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd40f9asm404975985a.41.2026.02.05.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:58:46 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	corbet@lwn.net,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v6 0/4] tracing/fprobe: Support comma-separated symbol lists and :entry/:exit suffixes
Date: Thu,  5 Feb 2026 08:58:38 -0500
Message-ID: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the fprobe event interface to accept comma-separated symbol lists
with ! exclusion prefix, and :entry/:exit suffixes as an alternative to
%return.  Single-symbol probes retain full backward compatibility with
%return.

Example usage:
  f:mygroup/myevent vfs_read,!vfs_write,vfs_open:entry
  f:mygroup/myexit  vfs_read,vfs_open:exit

Changes since v5:
  - Fix missing closing brace in the empty-token check that caused a
    build error.
  - Remove redundant strchr/strstr checks for tracepoint validation;
    the character validation loop already rejects ',', ':', and '%'.
  - Add trace_probe_log_err() to the tracepoint character validation
    loop so users see what went wrong in tracefs/error_log (reviewer
    feedback from Masami Hiramatsu).
  - Remove unnecessary braces around single-statement if per kernel
    coding style (reviewer feedback).
  - Extract list parsing into parse_fprobe_list() to keep
    parse_fprobe_spec() focused (reviewer feedback).
  - New patch 2/4: add glob_match_comma_list() in kernel/trace/fprobe.c
    so register_fprobe() correctly handles comma-separated filter
    strings.  Without this, enabling a list-mode fprobe event failed
    with "Could not enable event" because glob_match() does not
    understand commas.
  - Reorder: documentation patch now comes after all code changes.
  - Updated selftest commit message to note that existing tests
    (add_remove_fprobe.tc, fprobe_syntax_errors.tc,
    add_remove_fprobe_repeat.tc) report UNSUPPORTED because their
    "requires" lines still check for the old %return syntax in README.
    Their requires lines need updating in a follow-up patch.

Tested in QEMU/KVM but I am not too confident if I configured correctly and
would like to ask for further testing. 

Seokwoo Chung (Ryan) (4):
  tracing/fprobe: Support comma-separated symbols and :entry/:exit
  fprobe: Support comma-separated filters in register_fprobe()
  docs: tracing/fprobe: Document list filters and :entry/:exit
  selftests/ftrace: Add accept cases for fprobe list syntax

 Documentation/trace/fprobetrace.rst           |  17 +-
 kernel/trace/fprobe.c                         |  30 ++-
 kernel/trace/trace.c                          |   3 +-
 kernel/trace/trace_fprobe.c                   | 219 ++++++++++++++----
 .../ftrace/test.d/dynevent/fprobe_list.tc     |  92 ++++++++
 5 files changed, 308 insertions(+), 53 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc

-- 
2.43.0

