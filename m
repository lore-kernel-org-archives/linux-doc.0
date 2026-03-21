Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CC28D8DB;
	Sat, 21 Mar 2026 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100304; cv=pass; b=r/oa3KtakhJBC+g9FVRIPBfSTHhJpqtE3XIIDoTJV+nLI1Dcn4LF/g4TeXsFm4qFy3Yy5sqSV2MX0jqscFHzE55HtXjsMsj0YqtLQkEqEquX6PKoB/rsuLDkCP9NdJECEr0/jvFW1GhBNHXKArhTpnVctzhvQBGwYlPWurI0waY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100304; c=relaxed/simple;
	bh=4HzVYnO3PBIKAJDJOoPAvIbkD/vW1K5TfRzAa24DYAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DpFKPGO8Ducybtf20QSkSlqxvcSIf2JuHCkhspU85Ol9XRvD3T/WxSF2VyXAZg+Ge5B0rkpdSxBdKke67di3nXhGhxMvHWiEyPdz2/ht4aV7l3Osp49dqsjR3vPx3w9HeI/svpOrYPvDgVXeLIMydoc2KBt08ZT8WWG5u0oW9WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=OZs6wkby; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="OZs6wkby"
ARC-Seal: i=1; a=rsa-sha256; t=1774100296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSYmAF59ucyxVcEPUdLsbsjtGu+tOgCQdYioLlbe1gr1BVH8CHU9VR4WkqEIdLkK2YqIAXSHMQqQa2RSI/ne/0/YP0CcysFXWaexcAKcNHj0gYSpehYadPPbmbJG6eFUofScZjmR5xShIeWqftUiPeX5gQ/OiZzLcIuHA8VoU48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774100296; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CmMQir9cbcPYWE0pYmHsKDZ07DZ9tjDS9tROzmlqT/8=; 
	b=AAx4je4T9fbGjt0IY6qZzQu9UAjUZSn5pPwNShoCmmy9IfExhRGhSchaZ6IRCh1Nyla0C/fK8srLqLQaXNDs/zRODcytXSbbz22JN3pR/Hv2KtgyW29l6JgiecZ8zBJPBzSuXUjb83Jm9LwkM2NPf1mLxDJJtVLewLPnsV+DSW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774100296;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CmMQir9cbcPYWE0pYmHsKDZ07DZ9tjDS9tROzmlqT/8=;
	b=OZs6wkbyHjRU7flq7atizXF5NbAAZKJFyliAoCgZOGcffT0dXUw9A9Nlz4HWvGeR
	jOToaLzjvjtyHQAftG6KEhSvNKU+ryRdu9KpqWEImPfAO2CQcIqfcXyBfrDOdMUz6O5
	c9MDugpP/Zv5UoxvYXSVkBAl1DNE+0Hr0VbQqyTs=
Received: by mx.zohomail.com with SMTPS id 17741002945381010.6192178869668;
	Sat, 21 Mar 2026 06:38:14 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/1] docs: examples of pages affected by table overflow
Date: Sat, 21 Mar 2026 09:38:10 -0400
Message-ID: <20260321133811.17854-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages this patch improves:
  kernel-hacking/locking.html
  arch/arc/features.html
  arch/arm/memory.html
  arch/arm/omap/dss.html
  arch/mips/features.html
  arch/nios2/features.html
  arch/openrisc/features.html
  arch/parisc/features.html
  arch/powerpc/features.html
  arch/riscv/features.html
  arch/s390/features.html
  arch/sparc/features.html
  arch/x86/boot.html
  arch/x86/zero-page.html
  arch/x86/pat.html
  arch/x86/amd-hfi.html
  arch/x86/tsx_async_abort.html
  arch/x86/features.html
  driver-api/parport-lowlevel.html

Rito Rhymes (1):
  docs: wrap generated tables to contain small-screen overflow

 Documentation/conf.py                  |  1 +
 Documentation/sphinx-static/custom.css | 16 ++++++++++++++
 Documentation/sphinx/table_wrapper.py  | 30 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 Documentation/sphinx/table_wrapper.py

-- 
2.51.0
