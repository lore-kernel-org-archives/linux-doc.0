Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE792F361B;
	Mon, 22 Dec 2025 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407509; cv=pass; b=aRh0XH474+2KXty3Vp1LdNyj++pksjbdeOEOj7HS+OdX0hJI78LGbjKSko7v2SC86q4wwJtpf1+On8NZzQOBAKZQvGRvke1zeAWyRbCA/UAdhfiMirxfQ7B2HdURp8BPVELgmn2iG+XD63CTMHgnTybEkDN/EchCYhZ2jGtO3Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407509; c=relaxed/simple;
	bh=r6rcXqUdCoNEDVauW7Jj8K2krZrOBOOFgbuNBlsyND8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGgqWSq8ySQnTqroHN3LEP9T6GPGdtX1oBbioev4vAPPtlAsik+bLlP06VWg+m5K5f+1cbfjkEosU7Yuwx6B5r/yOx53RHwJZ/e6cYr0f2qcLWpjiVCsvsTHS7eySdw2gflWjUUyzVtLounNwW76DcplLHQ+2O1DYr8/IsZOi4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=T8IsI3r2; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="T8IsI3r2"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5BMC4KVr083291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 22 Dec 2025 21:04:21 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 51AA2109D38D1;
	Mon, 22 Dec 2025 21:04:20 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3Vt4RFQTgwT; Mon, 22 Dec 2025 21:04:16 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id C1AA610A0ECCF; Mon, 22 Dec 2025 21:04:16 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766405056;
	cv=none; b=A4uQ22f/H4x1hG8ZiuwmBVj/w9Gh6Xl6H+9ZiyKewBsS8+dyUzTkezeWWfuuMcMH3Vt+gROD8Op3irf0yTvus7SvygYbHRdvESnJDsCaNfm7Nn6jymXClJOoAJkB4k9fBoOVHF/mXkY2sd7C25v9wDIouzflHq/XskIN3JESb0I=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766405056; c=relaxed/relaxed;
	bh=8OFpXXeyC8oQ2LUH1geZW0L7WQv5zmcGUbqIc0sIfpc=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=tzkEKZYW8EtqRqGoq3A8CSzLqoZLPOv9eirya9HDg+ASAjkxKiL8JFcRgOpYg0a6cHsEnAdAzaMNjxgsT7ZDJtNcZSTwJXc/Tzju9FtU6yLeaYLnxk7u+CE9bYt79fLDgQLbDnR/mzPcaWBJefK49VoV/bwMGkAASaKMZrPsYxQ=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org C1AA610A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766405056;
	bh=8OFpXXeyC8oQ2LUH1geZW0L7WQv5zmcGUbqIc0sIfpc=;
	h=From:To:Cc:Subject:Date:From;
	b=T8IsI3r2dAXIIR6ZHXgxHQ4PEcw8Q+0MG4HxHq1pTUdyc2a72Nw0wznNq8FvJvj9a
	 n0HXa25lOEgcR33Z/VvGbS5nhAB/qrCnFzGz7Q7RNbx208JdijoGAYQBztZLxZT8PO
	 ovR9AbQKQB+OXGGb7vzU7uCZwy9w4D0Yk2k16+Ck=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, muneendra.kumar@broadcom.com,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] Documentation/ABI: fix typo "upto" -> "up to" in sysfs-class-fc
Date: Mon, 22 Dec 2025 21:04:14 +0900
Message-ID: <20251222120414.2422149-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a typo in Documentation/ABI/testing/sysfs-class-fc: "upto" should be
"up to".

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/ABI/testing/sysfs-class-fc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-fc b/Documentation/ABI/t=
esting/sysfs-class-fc
index 3057a6d3b8cf..786296aeca32 100644
--- a/Documentation/ABI/testing/sysfs-class-fc
+++ b/Documentation/ABI/testing/sysfs-class-fc
@@ -15,7 +15,7 @@ Description:
=20
 		The interface expects a string "<cgroupid>:<appid>" where:
 		<cgroupid> is inode of the cgroup in hexadecimal
-		<appid> is user provided string upto 128 characters
+		<appid> is user provided string up to 128 characters
 		in length.
=20
 		If an appid_store is done for a cgroup id that already
--=20
2.47.3

