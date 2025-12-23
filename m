Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BF2765ED
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766489397; cv=pass; b=APswObAuqEZs12G0GoTnvOMAk8Q1Dj55Ykg9hIXRSo4QRYX6GmLM5Cy602Sc49jixMHtXJq+gMiVttZxM+DfeEDduavQJdrg01q9YsV3fQq1+F+FiRPqFmUOxaape4u4FajBP9s62h14P//IvfdEnGTQP586D6i26wMlruK6W9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766489397; c=relaxed/simple;
	bh=OIEPPrJHyWpRZVcNnwuXw68ZpGKyt7HJqX9MrSScCys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxSrS1N/Yxx7FYTYTsCwxfYP632dJEMQlP895zg6FWr9Ibb2vdyJr9al1pd/JgaI7l1rWhUfWMDjl5OzV9d6qkoc/uYtLoxcRCSsPTYxTuou3/v4426fH+E4N0vfhIalzRJ8zSBGgAn/AAl7dQuOihbZ4ihzI+UXKawtSXBKb9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=k6sb4vBc; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="k6sb4vBc"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id D8491109D5746;
	Tue, 23 Dec 2025 20:29:52 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGWxWx7RfiDq; Tue, 23 Dec 2025 20:29:48 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id B9CFB10A0ECCF; Tue, 23 Dec 2025 20:29:48 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766489388;
	cv=none; b=Op3IjtSbH5/PFh/QZ4DwTlrkbaflAtmXqGJie84tHa+PB0TiJ4xOgK7nHWERDkZ3DlAJeXfvIBQBLTBZPlskw6PXCYlU6UtFblVdy640h4jfe+WJJO+pE5Y55JkR8riopzAIbkfdAwIcZE6xJlhgUtNpvKWM1A9PbFq+Gg2Wktk=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766489388; c=relaxed/relaxed;
	bh=28GtIl+OMZiLfZZh3on6JH9u6IPqB49bmZeuE2J+Yyo=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=rA3xIyg9LAE8RgG59NAaYfA+tt5O3wqnldYQ5HGFNdbqUaZ4F/N7kPYjscPaDptIziR187YItg0PmKA0yZ66ypRyDJX+l2gn/5lqXHMTmHjKULmSzCC5sk+DjqOoqc0nMI6tHtE//oxgG7EaxhFVF6Egxm6ZXaDd26ZRILb3Z0U=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org B9CFB10A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766489388;
	bh=28GtIl+OMZiLfZZh3on6JH9u6IPqB49bmZeuE2J+Yyo=;
	h=From:To:Cc:Subject:Date:From;
	b=k6sb4vBcFA+TKkuKQ5qRoKcSU6GR8gdQERcJd96fA5kVP+MkO+wKnm76tmQbfsufY
	 C2mWfw7ntEeTTiJ28mWfkuXsU+6BafLssha7VSD2b6ZVNeN1FTP2sngS3Fl6hxdp7r
	 8C5X96a9ZGfKW4p+OwPqzIP9MxEvfSPZA6obYIvw=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: keystone: fix typo in knav-qmss documentation
Date: Tue, 23 Dec 2025 20:29:46 +0900
Message-ID: <20251223112946.2580519-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/arch/arm/keystone/knav-qmss.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/keystone/knav-qmss.rst b/Documentation/=
arch/arm/keystone/knav-qmss.rst
index 7f7638d80b42..f9a77eb462b2 100644
--- a/Documentation/arch/arm/keystone/knav-qmss.rst
+++ b/Documentation/arch/arm/keystone/knav-qmss.rst
@@ -39,7 +39,7 @@ CPPI/QMSS Low Level Driver document (docs/CPPI_QMSS_LLD_S=
DS.pdf) at
=20
 	git://git.ti.com/keystone-rtos/qmss-lld.git
=20
-k2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin firmware supports upto 48 accumulator
+k2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin firmware supports up to 48 accumulator
 channels. This firmware is available under ti-keystone folder of
 firmware.git at
=20
--=20
2.47.3

