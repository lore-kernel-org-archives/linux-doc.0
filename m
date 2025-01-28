Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E68F54;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=AJLBPUnLwee/ZFmc4I27ny7tazJiYof+ZftmUd/c5hlqiX4cteH56NlbGBt56tKiBGj66+7C9nqikstjwvqWMGAb8E7xYs3sn2CFYFTE1er12fBxr4b2vMHIU+nHP9eCTyyuChywBf2HMJDw8QAasDiK0ioLVqmSWapks4xr+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=erz4OcTOvbnxgyfwrQKNDa0AznbtN3e8j1C5SQqASZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pL1FORstiGucI4rJLRuNzwbh2YalawBp+442p8J1PsQVtzHU5+7DPDDNuFtv6scCxNSK7sFxBzX4OzMlmHLYxrJz1sU9bszd6TZmwJuzmfA0GmUE1Ymsb1ZfJa8d2zEkBgJMOhHJJMPG6Kq9bE/gYuEPTuWlHL7oWInEQ3Ddx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TntjJdWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TntjJdWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B9C4CEEA;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=erz4OcTOvbnxgyfwrQKNDa0AznbtN3e8j1C5SQqASZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TntjJdWINE6c/nABfb/8Q9nhNMMR9l7sgFIx74N2eAXtt/m8Lw9T1vGnky0oCn0ic
	 FWtpq4cWerB1Z7UUepgCnQr2qIA8me/f7CxTZmbDkfSe1OuKkxGufdmJNEZ+MyrJwo
	 1rTJEcTXTkdSAEVE9mxNd/XV+fqr1mo11+E5X95VEuzS0AHyXnLnZ/f7YPv7nvhp3V
	 YQGWiNyJ+KhPaa0bjr3rLJY3/DwlNafByi0AVFIbqzQ0HP5gV+vQKPBdIIOWXxfkBF
	 JSp0YUEZXcfhtX37FsLeSRg4VdRg+VbHnQNomqcY1MU64nzhyrErikVpmb2HrFJCVy
	 2sYviSwNffDdw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRKx-3P8K;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 09/38] ABI: sysfs-driver-dma-idxd: fix date tags
Date: Tue, 28 Jan 2025 01:05:58 +0100
Message-ID: <08b4790d10620afda947814e1a4db744595b9b2f.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
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
 Documentation/ABI/stable/sysfs-driver-dma-idxd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
index f2ec42949a54..4a355e6747ae 100644
--- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
+++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
@@ -246,14 +246,14 @@ Description:	Controls whether PRS disable is turned on for the workqueue.
 		capability.
 
 What:		/sys/bus/dsa/devices/wq<m>.<n>/occupancy
-Date		May 25, 2021
+Date:		May 25, 2021
 KernelVersion:	5.14.0
 Contact:	dmaengine@vger.kernel.org
 Description:	Show the current number of entries in this WQ if WQ Occupancy
 		Support bit WQ capabilities is 1.
 
 What:		/sys/bus/dsa/devices/wq<m>.<n>/enqcmds_retries
-Date		Oct 29, 2021
+Date:		Oct 29, 2021
 KernelVersion:	5.17.0
 Contact:	dmaengine@vger.kernel.org
 Description:	Indicate the number of retires for an enqcmds submission on a sharedwq.
-- 
2.48.1

