Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434241;
	b=A03lCvawwRcMOm5kS8BWReRXjnkR4v9EDBGx51wrl36rC4LYEyfNMBdIcQHPLkFn6tqQ
	 wzd5L8pfRcik4nGB3Rm+8CfJ4eOpcSkAD8tDnc3QFup+N5AdBIXorzi4tq9LNNQdv6bHZ
	 T8Qf2Bl/PbFqkEVWGxkPlFk2UFlAaxMq7zVuq8wuH5qYIAlZVM5exbi2eC9H4JWhXvu7R
	 NJ8uF8YITMmmQBk+kv05gn6FIolePCe1Sd3acvbIBrOvpaEWOwS4ga1JAbF8629OZcS8D
	 mBfiNNWIHf7NaoUZRf182wQRl5WyI+QjlzhKXVxz1L3BDWxIsHMgUbVSXPPXjknHKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CUCPhF26O34G5hnc4b0my/OnjDHNH9LBcPnQRfSJOAE=;
	b=HHB7BXcBtfq10xR9DdbWxv4n18TlWJuPZItIF351VJXe6++zn8abDcL5zqnwVFUP26wL
	 rH8NJ/9K9ECkhDGiHIBteqMVkJHg24shwRUIxil3fOyJXrbfC/mmsMLOxVipD2+Vd3HCi
	 6KETUUpXfFi5inwYkLb4bGTDiy+wRYtqHE4tu6tY4jTaRxf93PqpQ9vWzUuwNzEnMA5ll
	 aL1yj+wY1XDDhPK85SeqH8RWWasIo/w0X/sA8DEBwSpXg27j8YE+sFWQedRVdgVzboD8i
	 kjHgTApXh/0kbMc3cbdCsbc+MZu0RjDzH7IP5emA4GJ41C6MEjB+KmVli6nHxFRFhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="UUvr4sN/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B25606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B25606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UUvr4sN/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38692f62b22so1761927eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434239; x=1796039039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUCPhF26O34G5hnc4b0my/OnjDHNH9LBcPnQRfSJOAE=;
        b=UUvr4sN/MtcnZrkf7SSPMNr/15ZxuOgbb28kzZqTuGqQ6LBtQ2ZdNerNQSKpHbc+vD
         D2jOHT1+NPxEkBdh29fuHfYcr5xI45SGAe3t6VudViVvTVVHzT8sgswoZCbfXv6H8ruT
         YSibo2KJHZpVRQonfAn/UYTRI8oHDeSgHUTZIfPzVssz1aLzY4MD0RJWcS1LK04/yvdQ
         r1ey5WaEGoHAM3BA1SgK8xdG435LEglsv+Z8fs9Ap+QPyyg9qwZBX8aq2ob2ZPwZggDq
         92gqK2X82bWDblJ2hcnLjkZzMCALia0f3DfHgkHm6u09MiZrBajP0/xvysUQIzG9vVN2
         ayWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434239; x=1796039039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUCPhF26O34G5hnc4b0my/OnjDHNH9LBcPnQRfSJOAE=;
        b=KPX1Gz0m7TyYs2uPEpLv733TVTNdm1XuJmGFqWMww2q6NMw4PGyigdCN/NtDKDt3gJ
         7szknqwu/sakV2iz2QrRg/qEfubTKJ5vC6IGfsM6InAXvhEMNIbYTJA82Wx/c5HA4nTK
         t+ecuPq1D55+xwf2sN1I+E8T6gB8OhO8Tp/SbF7kKtp9Fu+hB3GFPsqyK1F31qtN3bL3
         bAKfifH+r3iog0428u0tLl/QemKN4cCaQM5TmP77QgiZ2IJE8yf14yOLHrtXPq0IppFt
         2iDuW6kjJFlDP9A94FO1ffEUinEkVkdMhd86HdSnZynzJ17MkMuj2tchadVVd2vCThTe
         nePg==
X-Forwarded-Encrypted: i=1; AL+hErHcvEKKe1J7VQ0z+1HUUospFC2NyV7auAaXqCyeAZPy5e4jToT6DWzKC0tLK6lumsGvLUAeqhJ9Yo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TB0OnZkN47WskTod8WewvvVfKvUr3cUzvMvIp3EHUK45RCDYJ
	oTo9cntEbPKv0FdUNvqGiPb+EJyq/A5JA/mej2VRAwhKTyPzqz83PBlmh8VQ0DaPGHee
X-Gm-Gg: AZFdTZfJGaM/RaXncNEFqPRY2Us9ahCxS2/Bt/cvhfQO76kWO8wHvJ0IPJEpE3NQS+3
	vLtCemVkg0/wdelDCXK1EWt4zDLEsAApO4KJUiFTOc2tnpyVrK4C1zDHDgVc8ojk4dncb8QtNKn
	gFPgAHLvkWr2w0+lrmo0QGYs6NSDr661YiSUljuE3dEsRmoVf7XdrxzTg5kkHrm55+Fu1Wf2Zua
	n0P+UrhIz7TnYPyWz8daVlzOdlGFsairOX9kD/Gjbrq5r1M8+0Udoznv+/L+XWviGnTVXSWEjNG
	FyAhGpRB2VKnZcV9yIAXs/s3yEojy3H0TNwuF2+OGpiq/SuERrBt8DPq7FL61PrHAHEXsSlm9yz
	0bxVN59J1a/fNTstwEF1E5XtR13u+cB+BbK21fK+P/hBHSASq03YyltMoPDILC9z4/3iTBRDtP2
	o7zq/I+s0ycRcDXj3V7hNnWERZTvNGRLna83xnmWh7/v70/qxJZzE4k2Fu4Zy3OU8KwoyaUbLfB
	bqpJa/ib1aIQcFuH4gm41RH3D+pqmPH1Tx5LsL7KO1X+7t1gUEf7UkHkvhS4tSQV2DvfNZ+4J9l
	A1WMmpiMyTWTXw+B/pWbb+lYnwlYhroI2dO1VkiX8+av620A5llYJ6TZYTJoDX+00SzJAv4O4fI
	OYmjiYVPasdmpvHPDiBymKI0Df3777rrVEG34KOjdrczoM35nqS2+2w==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr2766188eec.40.1795434239138;
        Mon, 23 Nov 2026 03:43:59 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.43.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:43:58 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 0/6] security: introduce Kernel Assurance Plane
Date: Mon, 23 Nov 2026 17:13:02 +0530
Message-ID: <20261123114308.8103-1-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel Assurance Plane (KAP) adds an objective-scoped authority context as a
kernel object. An Intent Lineage Group (igroup) is that object: an externally
managed authority whose lifetime is tied to an objective rather than to a
process, a thread group or a sandbox, that a trusted controller can update or
revoke in place while unmodified worker tasks keep running.

v1 [1] was the design document. v2 added the implementation and moved the
control plane under securityfs. v3 [2] reworked the design document to answer
the v2 review. This version folds in the v3 review: automated review findings
and a request to put a diffstat on the cover letter. The design and the model
are unchanged from v3.

Changes since v3:

* Fixes from automated review (3/6, the LSM). Each was checked against the
  source; findings that did not reproduce were left alone.
  - Fix a use-after-free in the link check: the source parent dentry was read
    and then used across a sleeping allocation and d_path, where a concurrent
    rename could free it. Pin it with dget_parent and release it after.
  - Fix an uninitialised-stack infoleak on a short connect(): the target
    render read the address and port before addrlen was known to cover them.
    Require a family-sized addrlen and otherwise leave the address for the
    protocol layer to reject.
  - Close a fail-open path: when a mapping's backing path cannot be resolved,
    mmap and mprotect now run the execmem predicate with an unresolved target,
    so a revoked or expired igroup still denies rather than allowing the map.
  - Normalise /proc/self to the thread-group leader in the current PID
    namespace (task_tgid_vnr) rather than this thread's global PID.
  - Do not let an exact-path deny be slipped by unlinking the file first:
    d_path renders an unlinked file as "<path> (deleted)", so strip that
    suffix before matching.
  - Match a user-namespace create as "user:create" so a "user:*" allow or
    deny applies, rather than a bare "user" that only matched a wildcard.
  - Guard the transition-sequence parser against u64 overflow.
  - Reject a lineage root that carries control characters or the JSON string
    metacharacters, since it is written verbatim into the kap.events JSON.
* Control plane (4/6, securityfs).
  - kapfs now sets its superblock operations (simple_statfs), block size and
    time granularity.
  - Validate the lineage-root write the same way as above.
* Design document (1/6).
  - Clarify the epoch semantics, which were contradictory: a running task is
    narrowed by installing a new authority at the same epoch, which re-points
    the bound task without interrupting it; raising the epoch is what revokes
    a task, failing its checks closed until it is bound again.
* Cover letter: add the diffstat (thanks, Lorenzo).

The prototype runs as the guest kernel of Kata microVMs (Linux 6.18) and of
Docker Sandboxes (Linux 7.0). In a Kata guest under nested virtualization,
running the same binary unbound and then bound, enforcement adds 154 ns to a
read and 787 ns to an open, while the unhooked getpid control does not move. On
Docker Sandboxes, allow, deny and revoke were exercised on a real agent.

Known gaps, where feedback is welcome:

* Whether KAP should keep its own mediation or compose with Landlock and
  existing hooks is open and is question 1; the current series is the
  self-contained form.
* The authority wire form is a strict subset of JSON and is experimental.
* Decisions are serialized by one spinlock, and those that resolve a path
  allocate a PATH_MAX buffer before taking it. Both are prototype choices.
* igroups cannot be removed yet, and kap.procs keeps the pids written to it
  after those tasks exit. A task's binding lives in its task blob and is
  released with it.
* A thread created while its process is being bound can miss the binding.
  cgroups closes the same race with cgroup_threadgroup_rwsem; KAP does not yet.
* Control writes need CAP_SYS_ADMIN. CAP_MAC_ADMIN may be the better fit.
* unshare and setns call KAP directly because they have no LSM hook in this
  base (question 5 in the document).
* There are no selftests in this series yet. It was built with and without KAP
  and with networking, namespaces and io_uring disabled, and boot tested in
  QEMU with lock debugging (PROVE_LOCKING and DEBUG_ATOMIC_SLEEP): the control
  plane, file and exec decisions, epoch revocation of a running task and
  kap.default.
* The LSM ID is provisional and is for the LSM maintainers to confirm.

[1] https://lore.kernel.org/linux-security-module/20261021165748.19304-1-ketan@armoriq.io/
[2] https://lore.kernel.org/linux-security-module/20261110202246.274-1-harisudhan@armoriq.io/


HARIHARA SUDHAN. R (6):
  docs: security: Describe the Kernel Assurance Plane design
  security: kap: add the LSM ID and internal headers
  security: add the Kernel Assurance Plane LSM
  security: kap: add the securityfs control plane
  kernel: add KAP checks for unshare and setns
  MAINTAINERS: add an entry for the Kernel Assurance Plane

 Documentation/ABI/testing/securityfs-kap | 111 +++
 Documentation/security/index.rst         |   1 +
 Documentation/security/kap.rst           | 341 ++++++++
 MAINTAINERS                              |  10 +
 include/linux/kap.h                      |  16 +
 include/linux/lsm_count.h                |   9 +-
 include/uapi/linux/lsm.h                 |   1 +
 kernel/fork.c                            |   4 +
 kernel/nsproxy.c                         |   5 +
 security/Kconfig                         |   1 +
 security/Makefile                        |   1 +
 security/kap/Kconfig                     |  14 +
 security/kap/Makefile                    |   2 +
 security/kap/igroup.c                    | 976 +++++++++++++++++++++++
 security/kap/kap.h                       | 160 ++++
 security/kap/kap_lsm.c                   | 903 +++++++++++++++++++++
 security/kap/kapfs.c                     | 530 ++++++++++++
 17 files changed, 3084 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/securityfs-kap
 create mode 100644 Documentation/security/kap.rst
 create mode 100644 include/linux/kap.h
 create mode 100644 security/kap/Kconfig
 create mode 100644 security/kap/Makefile
 create mode 100644 security/kap/igroup.c
 create mode 100644 security/kap/kap.h
 create mode 100644 security/kap/kap_lsm.c
 create mode 100644 security/kap/kapfs.c


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

