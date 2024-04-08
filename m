Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BEE44C94
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568243; cv=none; b=pqOvrAfPnVQzPoHrc2MFoFP5pyC6VsVxmSatboFgZBkubdUI1f2gwHy3NSTkBvB3WNlie+Pq8zOwutUxB3tq5o769LPVYlfn+eg4KjButq1iFbguUZjZUOztNwg97EaBmVZFaKylRSD5lbs+EA7AH0TmZX6CjG0he9VRWiWQ61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568243; c=relaxed/simple;
	bh=ICs+u9rBG30iLIjqnwXZWGRQcWcMg94L9Zi4ej2fBQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YBnGnRYqbYIXFsh6kZUcNV9/xaRDj5g8SXxQEAH092x2nj85voUfCOV+GgRDiGFAyj4K6O8AwiCSzI8C7XrWGLdVskFQAxB3Xyl5fM65wjyOI2r4RA+jdZpK7+7cMN9QRv3QkxUv1R6jBRHNasRwzDmQy7jGR/3Bs1XwR6Y0ZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=JiIH9CeM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="JiIH9CeM"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1989801b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 02:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1712568241; x=1713173041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeAbRrJDztscl5/TW7V1ARLwQeuNe6mEEXuD02Yifdg=;
        b=JiIH9CeMgynto2NyxCffV39aSrwn1c6s2kK0c6kkIPBhhEoM31Vn4aD7udHGK9V7C+
         EJLo6BmAoyUo8k/Pz6rZ4CAnEmGtn01FK/UOfsrliGuj6PUmtQ6XEUgLPlz6uIaUyWtU
         uz9pjNHxgd4wb7c1i7edU7+GcKKATRc6tyv8WStvwYFpjY12zqQ0QGQUyy9nO0Pc1Rng
         I9vNqjJ3Pcpn0/x+t4UxRHLoHAXCf4tWMzXf0OK093aGRY0FxbOik7sNPVhC38V8fgiz
         FNQY/nCXJpXcsu+TszuRD1qEzLF1lhRii3SI61aFs6C/aqCmojl4axSDMRDTskA7Knwp
         jlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568241; x=1713173041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeAbRrJDztscl5/TW7V1ARLwQeuNe6mEEXuD02Yifdg=;
        b=s3qXm5Q8PHR/Tf0oBxfmDDSI4+mzQlzkA5dQV4cZPTfjNJB6QewXUb9SxCBWEdPlSt
         jUV+8g20Sh1aOrtSKILRJvrbQDN0WHIXGf71fK9XVObseKL73/sJfyC+nP0Wfyhhf6jR
         BqR0jnE1Uiku6iFnwNEYJW3tvsSByfHoXUTB4N/l+p/WPnycnGmDOtyPWB8qDcifP0YH
         m1dZh2xj+SuVJccmeMjCdHF54zEztgYDc0x5ziFNaRfTsA7DDQ/l3yy+g9Nn0LQvhRH5
         /J5PdeKX54wkM9OneUl+G3KRHDrzHUPwqwCuXJKu5YoeV1WTPUvZe6lCOfpe3lItt9Hf
         OWbw==
X-Forwarded-Encrypted: i=1; AJvYcCX47EVQzJdhKpQUKxIVchwBXqHBvRyjFW9whp+qDtM3U30qNm307CMpsQcdd80CkBlBW+E410KPhjfRfoCGSBd5/+5YB0wThs3R
X-Gm-Message-State: AOJu0Yz5Ev1dWcT4scerPeqaP1rLxvBF4GDTPZPzja0tTwsLnfc4Eksh
	dJcD4xEti/x4zloQaIZHvg8iaETUUVESQCYcYIt7k11b0CVxV6eY9FW2ZaRF0rVhDJzSCjhOvi5
	u32GY7g==
X-Google-Smtp-Source: AGHT+IGiGt/VGr1bX2Yiw0D3BskqlspmfTUIHtrmQu+g7RLq1HRe3/xZmJQ/zwHYv3XKJbJ9OaS96A==
X-Received: by 2002:a05:6a20:6a0d:b0:1a7:8ef6:12d2 with SMTP id p13-20020a056a206a0d00b001a78ef612d2mr425870pzk.18.1712568241381;
        Mon, 08 Apr 2024 02:24:01 -0700 (PDT)
Received: from seacloud.vm ([143.92.64.17])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090341c100b001e293b16d8dsm3258731ple.1.2024.04.08.02.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:24:01 -0700 (PDT)
From: Haifeng Xu <haifeng.xu@shopee.com>
To: reinette.chatre@intel.com,
	james.morse@arm.com
Cc: fenghua.yu@intel.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peternewman@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: [PATCH v7 0/2] x86/resctrl: Track llc_occupancy of RMIDs in limbo list
Date: Mon,  8 Apr 2024 17:23:01 +0800
Message-Id: <20240408092303.26413-1-haifeng.xu@shopee.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing a monitor group, its RMID may not be freed immediately
unless its llc_occupancy is less than the re-allocation threshold. If
turning up the threshold, the RMID can be reused. In order to know how
much the threshold should be, it's necessary to acquire the llc_occupancy.

The patch series provides a new tracepoint to track the llc_occupancy.

Changes since v1:
- Rename pseudo_lock_event.h instead of creating a new header file.
- Modify names used in the tracepoint.
- Update changelog.

Changes since v2:
- Fix typo and use the x86/resctrl subject prefix in the cover letter.
- Track both CLOSID and RMID in the tracepoint.
- Remove the details on how perf can be used in patch2's changelog.

Changes since v3:
- Put the tracepoint in the 'else' section of the if/else after
  resctrl_arch_rmid_read().
- Modify names used in the tracepoint.
- Document the properties of the tracepoint.

Changes since v4:
- Add Reviewed-by tags.
- Include more maintainers in the submission.

Changes since v5:
- Update the documentation and comments of the tracepoint.
- Code cleanup.

Changes since v6:
- Add Reviewed-by tags.

Haifeng Xu (2):
  x86/resctrl: Rename pseudo_lock_event.h to trace.h
  x86/resctrl: Add tracepoint for llc_occupancy tracking

 Documentation/arch/x86/resctrl.rst            |  6 +++++
 arch/x86/kernel/cpu/resctrl/monitor.c         | 11 +++++++++
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  2 +-
 .../resctrl/{pseudo_lock_event.h => trace.h}  | 24 +++++++++++++++----
 4 files changed, 38 insertions(+), 5 deletions(-)
 rename arch/x86/kernel/cpu/resctrl/{pseudo_lock_event.h => trace.h} (56%)

-- 
2.25.1

