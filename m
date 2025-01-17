Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE801A3AB1;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=JP9zlgp7gDzoHRm36I6g4+/0HcMlbVKnwFUepruD0fFnlzvQH8xhUhT23GKRay9XUbAuA/DGj4T7cjGItRnoPO8eTTRUH+nHtsIUW1GNdX1mN6eO66s65H/P1uAaGaAh41T+rKKoKk2uvmngivbXyO9qx2T2R3gGRMlzFoeS4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=eIZnybLSi/SLtggShPreZtgXkXe68+zdK87zK1E6aBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGF4yq/YKUnkDaGT45A2X0xhU7mjUITuGEDK32bJ2dJXkdd98feydpc9FeHmfRqVDRXZ7FN1v3A+qsgC8qhDFWa1IJAW+f1HYRyWyT06a3gBjwbFd36ymRKROZ1f4AhTfsnaXPSlI2nxw02PhV1zdCYsBLWBRBecMytZjpMcUxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ0CPjeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ0CPjeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3653C4CEE5;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=eIZnybLSi/SLtggShPreZtgXkXe68+zdK87zK1E6aBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LQ0CPjeRomhFFivBHEMXxVMtQP6ArQOenqkH5GJGLVKNAkyrc5VWIyMJ4PFiHjKbY
	 /cU0sdHLypqD0i+Gm/PeKDFE6R4Ocpc9ZK4VTGruCGmCgFbLyHM2PgOBGY8TDyZBjZ
	 B4429v/xUGcKDIBwHmLHEHaopdkYhMQ7QMa6jWCV9MdLMzvoxqsBmoxhIUb5HGiZyK
	 2kQvCVZvRKucD9CorqAuOqx3CbbbMHjELlwigycTLby17ZdBdjNrduZI0qJUJf5nQP
	 vIjxV7i1+H9Nkfsrn06XjmH1iGGXS+0gVRMya9bNTDj15BDW4So+9q228ziSreuL2Y
	 x1ZVds80tZYSw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajn-210m;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Chao Yu <mchehab+huawei@kernel.org>,
	Jaegeuk Kim <mchehab+huawei@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 05/10] ABI: sysfs-fs-f2fs: fix date tags
Date: Fri, 17 Jan 2025 18:59:34 +0100
Message-ID: <c8bfa2da4e705aa036f773947a99f2cc8d37ca1b.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some date tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..e44bb614964b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -347,7 +347,7 @@ Description:	Used to control configure extension list:
 		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
-Date		April 2019
+Date:		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
@@ -355,7 +355,7 @@ Description:	If checkpoint=disable, it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-Date		July 2019
+Date:		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
-- 
2.47.1

