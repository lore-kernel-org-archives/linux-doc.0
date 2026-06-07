Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C227F72C
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845536; cv=none; b=T2M+mR46SlJyofsaUF+vY5B0Bai1v51YVU8AfT4XFUoMblNl7H7vz7c85Ge+WLw97YwlAmXB58fgyxM7VHnyEtkbPY502bF3gxaem19joG4+FRyfzMUYANpMihRHsKwEIgispmLN+zQplhJ7xXqc+nLo6KjMAid+9tbaEg9pzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845536; c=relaxed/simple;
	bh=OYMwu3Fju+f/m8eswGA1SlTLZA0MB/ymEEvGRmV1vKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGUZ9ph/YVd1ww9D+CKaw3ypChZ7ftq2PoFVuuItC55L+ZVFUla/vvXhBlk4TrDJnNvzj/D+8Z3EONyp4eZ6j39vEC+GhKHE/f4T2tnPTzMMRUVwXzIMlrlCrZqsAyx2BsMyVeh4ukEfkox5TdO9Wpif7YpKFuoF3pH0SqSj0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nczgX5s1; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nczgX5s1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780845520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xy4T/MjM8NbUD4tvmpx+3DPpHKif/NUp83oSBCJIiAQ=;
	b=nczgX5s1EZl14V4LvE45s0Wz85Rp8H70CYVEA+EFc0309GjcT9oZmxByq9o1QX64ob8A4q
	U3uoz4Yew0osY8mgg8Dh1KRGGxTqTRAk1ff28390xbFOG+4Ey1BtprT+RUnDvIe+kQaTeH
	dgDGPK5dzaVxAOaNlvbXmoMpCRzGtCY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH 0/3] x86/vdso: improve vdso=/vdso32= boot parameter validation
Date: Sun,  7 Jun 2026 17:16:15 +0200
Message-ID: <20260607151614.79567-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=thorsten.blum@linux.dev; h=from:subject; bh=OYMwu3Fju+f/m8eswGA1SlTLZA0MB/ymEEvGRmV1vKk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmq3XZXXT1rMt+vq+44IH29pihlnmmhZ6WFnIHQtphz+ nfYjn7oKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgImU+DD89ymQadGam8dx6E6+ s2A6o+qqm81P5nsEf9twx/r2idxbMowM5zX3yxvc4vu8wHLXq68v3ZhfH91ov+68250rtzxWfJ3 SwwAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated simple_strtoul() [1] with kstrtouint() when
parsing the vDSO boot parameters. This provides strict input validation,
rejects partial input, and warns when disabling vDSO for invalid values.

Adjust both warnings for consistency and update the documentation.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Thorsten Blum (3):
  x86/vdso: use kstrtouint() to validate vdso= boot parameter
  x86/vdso: use kstrtouint() to validate vdso32= boot parameter
  Documentation/arch/x86: remove obsolete vdso32=2 compatibility note

 Documentation/admin-guide/kernel-parameters.txt |  5 +----
 arch/x86/entry/vdso/vdso32-setup.c              | 10 ++++------
 arch/x86/entry/vdso/vma.c                       |  6 +++++-
 3 files changed, 10 insertions(+), 11 deletions(-)


base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d
