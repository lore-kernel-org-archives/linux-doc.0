Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE01CEAC2;
	Mon, 23 Feb 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771852028; cv=none; b=sNcTy1U5HUD6Gp6S+iK1hRyPiPL4d4cFOCPk7mfJIWgy3XKpjt71h1VmtCROUE7qeRWtyzeT8tBj4YZxOLBHDpWxMHMnPKXqs/1VGPb7DVtaxZkYUvXCeek1Jp2T5URlvovmKUjlVgdph/gAqe5nsQWPmPuIVcRyVQJMqCB7+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771852028; c=relaxed/simple;
	bh=Al5ry9Tw3TXFF1wBYa55FOJlf8Hc0k/L19k300PtU6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A8Vwa1D+ZwajXVl9PVrgNFFLtEmM1EtaBItjuOV7kt5BB449zZ+0T1Dp9urEsS3zJQhJbWg/eLVSwJPXi7cgOrU0p1H1rOVVGpOz+LYh0xhjLsw1Pqcd6adU3w1RjurvAU4XHMNYLt3CaB7OeQ1Bmf2grMNNuWCLrAE5TfBjgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=i0xL+IiM; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="i0xL+IiM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Cc:To:Message-Id:
	Content-Transfer-Encoding:MIME-Version:Subject:Date:From:Reply-To:In-Reply-To
	:References; bh=UmfkLslOKQX9BPhL5T4Kn1u577CL5Ainz0KNb8Uft/o=; b=i0xL+IiMLVz9i
	BYeSrtkYlOxVb3Hwdx3QH/eTSq6Uz3SW2pjtvzipcTOOuYu9vX7mqZW3TWZ793R4n+ndARads9uUS
	RT02WsU4lWoKdwAC0H/C5v2q6YiAcX9o6qTI/F1FFg6rgZO/DbeXO+Gy7yQgmKnJwl3KAdd41d/MZ
	Q/kqDONAC+2u+tpp/6g9BZ+p4Pb9PhgfwhgHuHo+5FCjeOu3R9IMhmBH7kOYxxpfnwzhBFBNSlZdN
	c9u3PwYKC/7u2H+WaYI1l9mRcPW7cniTtw5Pc+znAwcre0sBs+gHZFPEKmWTunWKWfbNRF0SXCGez
	IotLPnb1DnZb/Lr4R3vEg==;
Received: from host-79-54-159-88.retail.telecomitalia.it ([79.54.159.88] helo=localhost)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vuVdv-009iSL-W6; Mon, 23 Feb 2026 13:06:32 +0000
From: Matteo Martelli <matteo.martelli@codethink.co.uk>
Date: Mon, 23 Feb 2026 14:05:31 +0100
Subject: [PATCH] sched_deadline, docs: fix cpuset example for cgroupv2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-docs-sched-deadline-fix-example-v1-1-8d0bedc2bc6f@codethink.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDQAwFf0VybmCNVUp/RXpYNq81YFfZgAjiv
 7t4HAZmDnIUg9O7OahgM7clV2gfDaUp5h/YtDJJkCGIdKxLcvY0QVkRdbYM/trO2ON/ncGtPl9
 hUOmlB9XKWlD1fRg/53kBohuD63EAAAA=
X-Change-ID: 20260223-docs-sched-deadline-fix-example-1d4806d2525e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Juri Lelli <juri.lelli@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matteo Martelli <matteo.martelli@codethink.co.uk>
X-Mailer: b4 0.14.3
Sender: matteo.martelli@codethink.co.uk

Documenation/scheduler/sched-deadline.rst provides two examples for how
to setup cgroup and cpuset for deadline tasks: one for cgroup v1 and one
cgroup v2. The code block in the latter is not properly html rendered as
the :: marker is missing.

Add the :: marker before the code block for the cgroup v2 example to fix
html rendering.

Also make the example description more explicit for better clarity.

Fixes: 0116765035eb ("sched_deadline, docs: add affinity setting with cgroup2 cpuset controller")
Signed-off-by: Matteo Martelli <matteo.martelli@codethink.co.uk>
---
 Documentation/scheduler/sched-deadline.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index ec543a12f848..d23e4afe1a9a 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -700,7 +700,8 @@ Deadline Task Scheduling
 5.2 Using cgroup v2 cpuset controller
 -------------------------------------
 
- Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``.
+ Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``, an example of a
+ simple configuration (pin a -deadline task to CPU0) follows::
 
    cd /sys/fs/cgroup
    echo '+cpuset' > cgroup.subtree_control

---
base-commit: e1e828a1e9a79af76a7cdc271e0a506e496c2eaa
change-id: 20260223-docs-sched-deadline-fix-example-1d4806d2525e

Best regards,
-- 
Matteo Martelli <matteo.martelli@codethink.co.uk>

