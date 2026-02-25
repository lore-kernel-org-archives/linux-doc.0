Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820FD2F5313
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004046; cv=none; b=esj6wOPrBvAKj0R0fZWWyDNY5azhp8JmL0iXFVSOHBrnTk9pm0kg3ZVeXb5mB7GDqucuDWoTIQ3X/RNeCtDtwgtY/xJjNj0WTsUpt0Yx0OmXJR9IMgaueCU7MrivfQzRDmThEm9+m4ZVkc2hSVcnoW+TWez+ct11498BZ6e2TWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004046; c=relaxed/simple;
	bh=1KBuBd+iCF9NBYsLqHZsB0ZWhDlklDnzPDb6M6VWVQ0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=di+6qCNxEJxeIMx9CeSrG7YavLkpY+/NjpF1gGw9qFYFkWjATVHtHMIvSY43XaFAZCbNNWSREofjSmoblesxjVY5gXmN2Le6Ha2ntXxfB2u0W0QBPFD9e5vxhQyOCaiaDjvdu9yAalUytveIsw7muB5t1sqPUw5bgpGDKYjapk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxY3I4e6; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxY3I4e6"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso3822761a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 23:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772004045; x=1772608845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d6TXtnvwLicbHQpLQAZLl5+hwl+mc9lbUmp9ZzO2MHE=;
        b=KxY3I4e64XPtdRbbquS4fw0lcME1kABx69qQtcxLG7HAKbH015pBZdaW15w4zlweQr
         nO3ktmIczHBdBPiNPvR6ZLg8VBWbc4w3vuKVJIsg+h8AlLp0GhJa+f2LhQiWBTD8WZQ8
         /Pu76DqcMoFnZWKmKr6zKZTbCZKaEHjJt7Ncbq6g6rPsydfzugoYaqBE871usY/61kIQ
         OX9dsX4HoMMOT7F2JxrmvleF5qfdtn94V086BhflR5txb/s6UInSajy8p+sJoZKziIsg
         vCRJ/qYfSIgyxHA4ZwSFXqRtgQ8yxg2tjJC6QQv8pDjxox4NXmiuA4L9LpfjQFEiGdX1
         YwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004045; x=1772608845;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6TXtnvwLicbHQpLQAZLl5+hwl+mc9lbUmp9ZzO2MHE=;
        b=Aj1Q4pPmmvVYNbTRT0ed1JK8bh4/M6d41fxxcoKURvIsar7GrJfaA05rCAEYrE/AFE
         vBfQ69mJIyqp0qnIXA4PGjn8lxzrabDkZwJUAcwKJ1TpNz6A6OVl2G0bFWj4sWDxog7w
         fztUm/sw/kbBRDtRDyvCgZpRv0KYhZ7drzrh9sQ6J537R4hzgyS9OzlfsI0E0nHsQdzz
         3ru8NrDfYbdxJChHwXZcbbDkB0FcOub+XMFntuV39G8NKy9eLp8hn2O1qYw5AfjGlUqe
         2UOrav8vN2Y0YuGCuy8DdLtd5TZht5Q2FchrtqMao3+Px//Nc5mU6X8OTgRhIEVttx0e
         BOvg==
X-Forwarded-Encrypted: i=1; AJvYcCUTh0NV1q9mAn+Ccxdkd9/K3s7jLw6vzsGh8zgqunIoBM3EZXXqdDO/kTfpHNxj7IpLjqTf+ZK7hsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySY59izsdvUO3EkZr+t3jTfVxim2TSJZ4+eQlkSyph+1IOX+Ia
	A2fXTrdcxCI3nbKED3y4/YcsLdctruYn4C1UqzjRfr+zyxso8M3F3X/hV7mKmHbD+rpZvmszmNC
	q9fV38IHPSolg+0uPfsVJ5DBJqQ==
X-Received: from pfrd8.prod.google.com ([2002:aa7:8e48:0:b0:7dd:8bba:63ae])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4b48:b0:824:3cf6:3fb4 with SMTP id d2e1a72fcca58-82724ad3d76mr1244872b3a.32.1772004044566;
 Tue, 24 Feb 2026 23:20:44 -0800 (PST)
Date: Wed, 25 Feb 2026 07:20:35 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMSinmkC/x2MQQqDMBAAvyJ77tJkgy30WugDei0ekrhqsImSF
 RHEv5v2OAMzOwjnwAKPaofMa5AwpQJ0qcAPNvWMoS0MpOimiGrsI0eUBd138qPg3ZjO1K1WpDW UaM7che0//MD79YSmSGeF0WWb/PB7jWu8Jt4WOI4T4brp3IAAAAA=
X-Change-Id: 20260225-gmem-st-blocks-733f35d10211
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004043; l=2746;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=1KBuBd+iCF9NBYsLqHZsB0ZWhDlklDnzPDb6M6VWVQ0=; b=Zz87QRaHSCeDiOsHB8ebvN65q32EcPSJmRS6Ln83VHPYZkFWp0MlXR9c101r0+U45Euo2bPtx
 hkGErWsyijFCg09E6FZl6oFb5HuZujG5xLp0UOWWG/tslIKNb5ZEzQL
X-Mailer: b4 0.14.3
Message-ID: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
Subject: [PATCH RFC v2 0/6] guest_memfd: Track amount of memory allocated on inode
From: Ackerley Tng <ackerleytng@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	seanjc@google.com, rientjes@google.com, rick.p.edgecombe@intel.com, 
	yan.y.zhao@intel.com, fvdl@google.com, jthoughton@google.com, 
	vannapurve@google.com, shivankg@amd.com, michael.roth@amd.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

Hi,

Currently, guest_memfd doesn't update inode's i_blocks or i_bytes at
all. Hence, st_blocks in the struct populated by a userspace fstat()
call on a guest_memfd will always be 0. This patch series makes
guest_memfd track the amount of memory allocated on an inode, which
allows fstat() to accurately report that on requests from userspace.

The inode's i_blocks and i_bytes fields are updated when the folio is
associated or disassociated from the guest_memfd inode, which are at
allocation and truncation times respectively.

In RFC v2, to update inode fields at truncation time, this series adds a
new .unaccount_folio callback to struct address_space_operations, which
guest_memfd uses to deduct the folio's size at truncation time.

The second patch, to use filemap_alloc_folio() during allocation of
guest_memfd folios, was written as a debugging step to resolve a bug
found by syzbot [1], but turned out to not be the fix. I include it
here because it cleans up the allocation process and provides a nice
foundation for updating inode fields during allocations.

The first patch was separately submitted [2], and provided here since
it is a prerequisite simplication before application of the second
patch.

Changes from RFC v1:

+ Removed a full custom implementation of .evict_inode for guest_memfd
  in favor of adding .unaccount_folio callback.

RFC v1: https://lore.kernel.org/all/cover.1771826352.git.ackerleytng@google.com/T/

[1] https://lore.kernel.org/all/29c347bde68ec027259654e8e85371307edf7058.1770148108.git.ackerleytng@google.com/
[2] https://lore.kernel.org/all/20260129172646.2361462-1-ackerleytng@google.com/

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (6):
      KVM: guest_memfd: Don't set FGP_ACCESSED when getting folios
      KVM: guest_memfd: Directly allocate folios with filemap_alloc_folio()
      fs: Add .unaccount_folio callback
      KVM: guest_memfd: Track amount of memory allocated on inode
      KVM: selftests: Wrap fstat() to assert success
      KVM: selftests: Test that st_blocks is updated on allocation

 Documentation/filesystems/vfs.rst                  |  8 +++
 include/linux/fs.h                                 |  1 +
 mm/filemap.c                                       |  3 ++
 tools/testing/selftests/kvm/guest_memfd_test.c     | 32 ++++++++----
 tools/testing/selftests/kvm/include/kvm_syscalls.h |  2 +
 virt/kvm/guest_memfd.c                             | 60 ++++++++++++++++------
 6 files changed, 80 insertions(+), 26 deletions(-)
---
base-commit: b1195183ed42f1522fae3fe44ebee3af437aa000
change-id: 20260225-gmem-st-blocks-733f35d10211

Best regards,
--
Ackerley Tng <ackerleytng@google.com>

