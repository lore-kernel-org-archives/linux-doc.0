Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8635B63B;
	Tue, 31 Mar 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954843; cv=none; b=MlQf8455RMUZ64rEz4zLuNNCcsBOXRY5hDEUO3hOI/SSq47xSbpJMX7fnouAcpx6F6R0/GT2XiWXZdVqyIsKivopzOMrVX2y/gqioodxAY4XjVa7yf9BMDU9Ent6px7MziVHdXZZ2AHaqGs+F+rSsJGQ00Z7Mk1o9Fc3o+fU4V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954843; c=relaxed/simple;
	bh=sn2IERkVdmqkYaK3VQGqabhZXZZLU8A7HNEDL/Sd3Yc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AcBW5sT+lRlLacPxgvL4XEAjxII2k/jeP6VytDb8sgx+qVITq66D/tnmICHlsGnP/iaPHv/x6+rwvVlEYr6+mRkenwiIE1Zl1bOAVQ28BCsLfLqVULHDzee3vX927RexM9tHw7mk9OzWMpHlg2sdPYw2z5umxrss48nr1doHsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=dE8Vf5J/; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="dE8Vf5J/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Wu0kJ3LjwGuLqf+bqeED2XteHKyJ+UaquG4MqK1gvVI=; b=dE8Vf5J/jzGvDZXHCRJIyYEgGW
	1Voqd4jaQzligfgS1kaKrv7d9d83URMonlKf5lxuG6vpRed//ziIZBdpZ0QJo+vRee1j3vIQ6mYnn
	CVo+pFhBZCKvpB3CSN6DKR6nl/91MuAXDuNBiRZzzqpW97k6OMjNtToIKcvYbCClMsjogS/1un99O
	GSR66fXod87bQwZyYiswaT0CaxiOrqzoLj5oAUM+bjCTS/6Zdew5Py0j0AcZMmpTuAPKSzmXHKu48
	4IYT1LkquEPCH3JqaDhJTwUY+Pm/H0+rgL701tap9v9ZrwSieWj+fHU3K++imtoPSFZya/b1jFMqG
	zkALpU0g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7Wph-002Aak-18;
	Tue, 31 Mar 2026 11:00:28 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
Date: Tue, 31 Mar 2026 04:00:15 -0700
Message-Id: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECpy2kC/23NQQ6CMBCF4as0s6amnSLFrryHIaaUEcZFIS0SD
 eHuBty6fMmf762QKTFlcGKFRAtnHiM4gYWAMPjYk+QOnABUWCmDRlII98lHDrKk0pq2Nqq2AQo
 BU6IHvw/r1vx2frVPCvMO7MXAeR7T5zhb9N79cxctlbTo9QW1xSqcrx217ONpTD0027Z9AXmrX
 TW1AAAA
X-Change-ID: 20260323-ecc_panic-4e473b83087c
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849; i=leitao@debian.org;
 h=from:subject:message-id; bh=sn2IERkVdmqkYaK3VQGqabhZXZZLU8A7HNEDL/Sd3Yc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpy6lIbUUGVPDcpq5XdqYwDox88VVcHc8/hPMCT
 lhhFrlCetSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacupSAAKCRA1o5Of/Hh3
 bSV7D/92nypTo8+jqtG7m8Zq75YN1MnkGK6eCTjWfzAPtO2FypfXPExbZSflS5W7RE9p3JbuU6p
 jCGyUCirvqDlYHzoXdg3nIV5znSULHPcGM+2C66SwwjazNhfg03Uu89FGYiZhQ+XC7F8tIEj4yg
 fDwxfeEdBeWD4h4AN3pi1rg5/A6Yvv77+Pzi7vBXtap/7grY+k+Cpyg7X6+JuQV9zlfhFSta1VQ
 McC2Ta6+nbQd60Q6wTkLi3FfJeFVLoFtkPhDBLHd+l8kg13KbOk3CG4RGnWzYQQH6Kf7bR2SDum
 /6i8EivzRHsDS7DiuainJVIl3ZRg8NpC5ArDH4cnFxbMe8BG/hvEpm3MRe6U+vgoetkHEMIYwHP
 H1WPJEE0Gb2p2j0D+SVa2GQ9bO7sUOj+SX+/vg46DXKsGNrMYlS+sZ4ETUe/wsHnCv9VEaS43wF
 xHVbILz3kfADN3INX0P61VFR8aLkWFOa/e0YBw4lDFK94VHrP02WZFjBOc2syt6ROiNy9s+gSvx
 Ljkq0KF2g6s3z9iO0UxmbKgXtcDKLcnaE8Ln4blXngoStSh/SwaebLK0C1IEQn0KkXjt2nDBDr6
 1N4A7OvKjo44k+2E9ObeupZ+MXjTS/tdszmvTKQG/xiYMDS6P0RXjjnZMqcTp48QBEfQUJ8Fd03
 /99mRw0zKbL0ZpA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When the memory failure handler encounters an in-use kernel page that it
cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
currently logs the error as "Ignored" and continues operation.

This leaves corrupted data accessible to the kernel, which will inevitably
cause either silent data corruption or a delayed crash when the poisoned memory
is next accessed.

This is a common problem on large fleets. We frequently observe multi-bit ECC
errors hitting kernel slab pages, where memory_failure() fails to recover them
and the system crashes later at an unrelated code path, making root cause
analysis unnecessarily difficult.

Here is one specific example from production on an arm64 server: a multi-bit
ECC error hit a dentry cache slab page, memory_failure() failed to recover it
(slab pages are not supported by the hwpoison recovery mechanism), and 67
seconds later d_lookup() accessed the poisoned cache line causing a synchronous
external abort:

    [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
    [88690.498473] Memory failure: 0x40272d: unhandlable page.
    [88690.498619] Memory failure: 0x40272d: recovery action for
                   get hwpoison page: Ignored
    ...
    [88757.847126] Internal error: synchronous external abort:
                   0000000096000410 [#1] SMP
    [88758.061075] pc : d_lookup+0x5c/0x220

This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
(default 0) that, when enabled, panics immediately on unrecoverable
memory failures. This provides a clean crash dump at the time of the
error, which is far more useful for diagnosis than a random crash later
at an unrelated code path.

This also categorizes reserved pages as MF_MSG_KERNEL, and panics on
unknown page types (MF_MSG_UNKNOWN), so all unrecoverable failure cases
are covered.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Panic on MF_MSG_KERNEL, MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_UNKNOWN
  instead of MF_MSG_GET_HWPOISON.
- Report MF_MSG_KERNEL for reserved pages when get_hwpoison_page() fails
  instead of MF_MSG_GET_HWPOISON.
- Link to v1: https://patch.msgid.link/20260323-ecc_panic-v1-0-72a1921726c5@debian.org

---
Breno Leitao (3):
      mm/memory-failure: report MF_MSG_KERNEL for reserved pages
      mm/memory-failure: add panic_on_unrecoverable_memory_failure sysctl
      Documentation: document panic_on_unrecoverable_memory_failure sysctl

 Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
 mm/memory-failure.c                     | 22 +++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260323-ecc_panic-4e473b83087c

Best regards,
--  
Breno Leitao <leitao@debian.org>

