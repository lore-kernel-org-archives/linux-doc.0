Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6465B3B3BFF;
	Mon, 23 Mar 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279819; cv=none; b=lbS9eTOLP2c2AQ5CmI3SQWiwPPJyIu+RVzZeZKbJN3VBVX9q7S/fB/TBsfSxCytPtrW/dTrI6EUcu9rOSlfzr3x2RRq3MDVf4kL1fiBjRB5ieanP6gChOORVJbYUJACYufLsTIi1iSO//zqstPj2KBJ5UN0jmyuIz1BbNVhDSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279819; c=relaxed/simple;
	bh=ekE5Tny1Xx+V82RXRpsHJQrWTjL4oleJkv6o/XxPjgU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HVsabeSxVHVXjgzUvM9WMZjdOvsEp7XorR6NYHTp8E53VWpThb1bHs+pjeG9/85iF+6++Vv2A54K6e6IDGgy2mAdOvjpc+/fWwWWKgkVLX05mvNATYIq1dwNOOVz5DNDeR5bnwh0oifq5xwR4TFlqHKxav1kXoEMo1AbUdRAtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=pQbZd86d; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="pQbZd86d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vA9Ij+/Q609Elrit4GKVMFUpunbjkkcelYfBBicOZm8=; b=pQbZd86dJkBY+IABU8IfWALc7/
	eX0tTVb//7xiwJjPIeAy2agEmkVEzeVBVRk5h0znczLx0j+zkfAoK0dpHa7wwfYdjkpQZnolPrKlg
	txCUumPNhV8eRkdDHWEhTuxyucqmKBEawdCxodRSWuLlpJ+vRFmjBUqx2E6yd2ZNtUbqzAbVQhpz0
	CmvBS6GznTaOS9KupgUzn+kN9qdSN960MEnt52OXxPZs8kxCIlC4JP9QXwmGYoa1wDLs+ygTQZBPf
	2Ey6PmZLCIGbVZPzj9xCdgxL2/+FAt4KHIl4TTzWzbh5MaAuf+WVcFmeH4y94a0HizrTfy7dCI9Lx
	uZGP3tGw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4hEI-007cwM-61; Mon, 23 Mar 2026 15:30:09 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] mm/memory-failure: add panic option for unrecoverable
 pages
Date: Mon, 23 Mar 2026 08:29:40 -0700
Message-Id: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVcwWkC/yXMQQqDMBAF0KsMf20gJqKSq4gUHaftdBElsaUg3
 l3U5du8DVmSSkagDUl+mnWOCFQWBH4P8SVGJwSCs6623nkjzI9liMqmkqrxY+tt2zAKwpLkqf/
 r6vrb+Tt+hNczwL4fFUvRvG0AAAA=
X-Change-ID: 20260323-ecc_panic-4e473b83087c
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276; i=leitao@debian.org;
 h=from:subject:message-id; bh=ekE5Tny1Xx+V82RXRpsHJQrWTjL4oleJkv6o/XxPjgU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpwVx9HaGZYv84Braytk/T3MaYFLeRjmkFLt3nd
 lL6I4QA6LyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacFcfQAKCRA1o5Of/Hh3
 bZnpD/9bXyyF3qL66jdVZN13ptQ6egI7kVu5i9rWvbW4W0vl+KI39mdkrjpljDbJNw2aiD4KzmG
 2JCreez4/a/FpHde6JqLnHb+UUH/kZvtqUZP8lBRxrca5mvrVyRyaKl743xws+IxcmWp8gOfvsU
 i/3mSQBWVsOgMuzTKvcFmZ97UmvvnFc6h3LkZB9JGWwnE+2rNeV54OaceEnHSCN7EKdpWS8FDIE
 G7ZHohkh9jn4EaJVs8gM0YSnC3tZkYNiS0WOE6ndi+GP5oarvTWgpAVRRxzxQySqYw7/iI9YhkS
 N9efZWxB0MMftEerilG5ccle3A7GSWB+9aQ5QEywSTOW5XIa0QLwZoP6WpCOQijw1MhDuiPMq+g
 FsovOV3ziI1tTRV1UWQ25yiUGVNpPUgzIz+oD3Y2Uzlx8FHDEHkqSvYP3eq2fksFYxE8+kPf9n9
 vktFMGCOiB4mw5VBp66Y7B0Qu9UUmJM6EaTJeXOmCrk0RUtP6RerXbUZVwNHljMyfJ+j5NLn42R
 dL8gK1tFKszjVN32dWwiX3N0at4cSKUjymOQo1YbGM7WHIQAs3aFA0ImqIKgy8x47eEH60zYWHH
 s4nLOPbQbdAZpdO113sR1ibe5F2sFrXDA7Mk21CnxonY/hqaJRkmyHn946cwF58rINxlKZcq46U
 fUKvxUnOz6Y573g==
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

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      mm/memory-failure: add panic_on_unrecoverable_memory_failure sysctl
      Documentation: document panic_on_unrecoverable_memory_failure sysctl

 Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
 mm/memory-failure.c                     | 15 +++++++++++++++
 2 files changed, 42 insertions(+)
---
base-commit: 63f5f5ffdf63d9c75a438c92be58177744b4c69c
change-id: 20260323-ecc_panic-4e473b83087c

Best regards,
--  
Breno Leitao <leitao@debian.org>

