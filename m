Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BA430F7EB;
	Sat, 21 Mar 2026 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116533; cv=pass; b=qgKKJBVAirUNudZwKybLGGSIx9JRyXwvTw4LwnJDkWkoomKot7SLMzk5yGnfRhBOn50SvquA5Ykq8Mj9KTEvdpI1MKN+zNES16VEmSj/mKUgsfSod7K/o34UGjfeUmPMrHCXU6rZoyHx80ztp5znWgrn1Y4RJ/qsjIR5UeAFsUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116533; c=relaxed/simple;
	bh=iqECGmda+qDh61bJk5GVeOEIjs2i5mzQ9rM+O7dsf8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPeh9F7Oef+FYrCpJlKOF5qUaRxUWZ1JiWaZde47zoNmwnCluV9oFMtvE/ZkV592D5iMfZyaL37lNaj+QncKsGibVPvqLvvlWJpsqJXEuAv4OWg+3MSgB9CqUuyRkExwmiBSZPiJ26gfKXPoYKAwseWRV86L9L11OnrUTaG6deA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=JdZZFV+F; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="JdZZFV+F"
ARC-Seal: i=1; a=rsa-sha256; t=1774116528; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RwqcXg4jcto+OuXrg5kCLJ2IhiOgXtcvzoEWVOSoSpMbIjV3feB9jvd2W/2ThzCvyd2riAnF57FRke0OaNUwJIEzdhGMDOWyEwLhCqcLu/rJ7pPPq3Tm8EGQh1O76w3IHX79R3QXOCYMNuqs7u60UwH53M2IImb3YcHbbVDyMXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774116528; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zme2o8WRnlfOC7PTflSSZ0BGzG26R0G9quZqT58R1Kk=; 
	b=WkStplAHXH4bgPeK1F6T+onMDeuvyqGBEWHpZG3zNVKegHfF4eTVNcEEoia7/WzPMEUohHzydeuZPXWYIk6Bw7AYJJZsSyda+/TCiHjOFOe0/ozchqDWbRQkvII48xSHQMuok/23uGoPvrgYBlnVnwFmdvRzGL45TNKThOr95TI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774116528;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zme2o8WRnlfOC7PTflSSZ0BGzG26R0G9quZqT58R1Kk=;
	b=JdZZFV+F6bLS2utQ3lEExayRcfbWsIKSwrOBZwHkZq3rvrSvlgepmD8op4YjO9b1
	dQgwsPZHXJe9kSoDUNRjN6D6WbQb5waxGAyrglUfJ616B/2fS1K9DwMAFa0m1HEejch
	PSaOTVEYKXcl3vdGgPvRLxG10xEzwSlTX0uqDMQk=
Received: by mx.zohomail.com with SMTPS id 1774116525995553.4001256750511;
	Sat, 21 Mar 2026 11:08:45 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/2] docs: contain overflow from long links
Date: Sat, 21 Mar 2026 14:08:39 -0400
Message-ID: <20260321180841.10166-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Patch 1 allows long link text to wrap per character so unbroken links
in the main document body do not force page-wide horizontal scroll
overflow.

Patch 2 remains necessary for rendered reference links inside docutils
tables, where the affected table case still needs an explicit selector
to keep the table within the content column.

Some of these pages may also overflow for other reasons, but the
examples listed under [2/2] specifically include tables containing
long reference links that may still need a table-specific CSS rule
to keep the table within the content column.


Examples of affected pages on docs.kernel.org this patch improves:

[1/2]
  firmware-guide/acpi/non-d0-probe.html
  firmware-guide/acpi/lpit.html
  arch/arm/vlocks.html
  arch/arm/keystone/overview.html
  arch/arm/keystone/knav-qmss.html
  arch/loongarch/introduction.html
  arch/nios2/nios2.html
  arch/x86/earlyprintk.html
  arch/x86/orc-unwinder.html#etymology
  arch/x86/tdx.html
  arch/x86/sva.html
  driver-api/xilinx/eemi.html

[2/2]
  arch/openrisc/openrisc_port.html
  power/apm-acpi.html
  networking/devlink/stmmac.html
  filesystems/ext2.html
  networking/l2tp.html
  process/embargoed-hardware-issues.html
  arch/x86/boot.html
  networking/devlink/devlink-info.html
  admin-guide/sysctl/fs.html
  userspace-api/ioctl/ioctl-number.html

Rito Rhymes (2):
  docs: allow long links to wrap per character to prevent page overflow
  docs: allow long table reference links to wrap and prevent overflow

 Documentation/sphinx-static/custom.css | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.51.0
