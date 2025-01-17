Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827AC1A3BD8;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=bozaXCmXdqJ22rswYoPFend1CZIV9d04dnZJ0LiYK4D58LSdI34/j3W1vy61aNelh2VAXMrLNVPc3tQv4PgVr8suL2ufM9CenjEPEH8c2L7lWttfL4G9F31jvgoOHXWKM94TuD7FrF3NMEnKC4EJWRZUb/ybhAA/1v3R/LPo0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=g6tnp2e5+rZEad/bKZCAx+K3zN94fParUnq2cjwVZ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulziZsQQhCLDgzcVczYNoam3WvHlGUy6ClBLM5b1yzpOVkheveDgyDipNIAOyrb3zI1gx+KIImtPpFBTOtHZKIErDv8ZJVJqNjRxPe+7GeczFsIvSleMTDfNGbt0NSaaiRrEcXyg+iedUAIIYGIC5kBnrLGxYxCNC2Bs9gNWfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FI/nLGox; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FI/nLGox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEF6C4CEE6;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=g6tnp2e5+rZEad/bKZCAx+K3zN94fParUnq2cjwVZ4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FI/nLGoxunHFbHVUh5O6ekNm2iIQdBgU4ntpXS3Rhz0+Hyzy0FcLaIzozbfiCkDyl
	 fYj/8+jw8QvrzEqwY8XRdroj65137z6wAb8X3hvizACG6LT9U1BTaH/49JS2E0WqE2
	 r3gixoWlltifSJ/SE5Wm0aLVwVJvpp3Jo92YYXMgmD8ZVdHXxqSavjJALHrx3HYMJX
	 OcvKuL4gNtSQcwmrAIdsy9z9pfJnSHhVoBB6GVTI6N0thyNZh14RGPwD5YLZbY2KPg
	 K0C+CC3k2eCRyS4YvOGKxvSBkGu94MlF2d/tWmLcfHQCsGm1fJB+uUGsRBFNPs9YkL
	 5/siorKVx6HeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajj-1tyA;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 04/10] ABI: sysfs-driver-dma-idxd: fix date tags
Date: Fri, 17 Jan 2025 18:59:33 +0100
Message-ID: <8ee3184748b8d595e7ad16cdfe0e77b2b62774a6.1737135484.git.mchehab+huawei@kernel.org>
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
2.47.1

