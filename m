Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620043;
	b=Ph2wYjII+YYI+S39jqMzpxo9y8t3SUx0PK9op0JXmz+bzbf8Q2sVJhFDhZXiKP+lgKFZ
	 mCx+H/vVX3dzshq0CMwj7Ztv/QvREZlSmiO7N9X84vwNO4ikLgF8vk2hLCG2ivTn+1+iy
	 EJDT4zZ+pvF2KWpBIUoHVNIzb++TfnLmO65y7TQ4c0daBXTfJnpS1lQJE9jTuRyb0CQzw
	 8PvsjDyx0SWbEaJPLSK+F9jDzHxVFQLatnbHxBEkU/Kt6w692Zl38mJjm3iyxmlOqMvbF
	 eD0ZtrPKYJKl0m5dKZ0aIwyr70Z+7hex7zZY+V80+pitZzqf3RDVEbai7SP6RW46FmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
	b=NNXdEgBnSarxOIkHu9d9GH1MRCGGNtBk3aD8+GXPG/ekUUJjo8eOD0M4yGqZUs7Zxqhi
	 gMe27vluUeRWLqYiILO23hw8CPKfmX8C3xD5aimWS2Kz6dxbhv4GM2+OKr4a4SDYqrRZy
	 UB8RImfErXVDg2rKDdYWTHCN9r6k0K3KEvdSfm3S8PrUWl1BB3MZi7W9sMmIk4SkPcASd
	 /APnubC3MwN9TCjPMUFq1b5X/FC34w7Zjm1VdrX+EPf/qd3tvqXb0BlOe4+zSMytBw4GQ
	 wywM1nZcdVYtMFYODoGUnh0eF4jVAJPUG1rLcRJjFFB6G/Xjuuef6fKr+LmWuJQO29Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPs7IeC2;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5870606A329
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5870606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPs7IeC2
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b88aab58fdso633111a12.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620041; x=1796224841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=jPs7IeC2SRkubIeMfVnhV/BhR49WqE7eahuEzR6lok9Tb6/91SnF6JgW3QvDRw9VIh
         I8NXvAazDYFAWvjL2/R5Brx3YKskZH5+t8TClG/n/H7N+mfcNGnDHTDUYE1iF4lz2sEr
         8MYzT/BBWPa8yU7bqPNSmvXOtyWTyA1wfph9fhRL7dRFWXFf+9LEenZH6NXyAJikaLMU
         w8Hx8OOb/rRljzVrIGU1RJDznnDds1VoXnAS5QjAQd45pF9bXy8nA/pg/XPK4KzKRJ4H
         uSKUl3EeuMxVaUeOXhKmwnIIrFIln8gdmrREcmWQiKyU3yrUkBvxnZ90UvLKy+OBlrFi
         +yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620041; x=1796224841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=sB8w0Hi5UWBsMfYgEOvKZkmQzHE8K+qn1ttQS+npS0n4FAG0fbkCV7lUsCS8mYZ0v5
         aBI/PwDVH3xL7F239XwE8NCfFuMs0lx7Amy54k9neV6oWYWQWdB/QljWKhUkM/61IwUe
         HvcFpCTG7sDMc398hvsPEw2IFmW7j8GGQMgm33M7bWFkI6HBQfhf8PwpuBDKwxJuyGsG
         a/8FBRCof228wWWfVdxd4R5k7RFS4QrsrBDfm/SzeVxc47WvmTyQsRb0DJWqSN76JvP1
         zwv+XwP2bJK1wPEgh2gegpTrL7kutvTRaJDyAFaTOwNsIVRNptB3g60/edsoGspi1V/p
         WyUw==
X-Forwarded-Encrypted: i=1; AL+hErE6brNDgN0WRc2LpUKnJLr495AYp4Mqwz3pJLmHeB4HcWmUF4vawtv0rFcPlHoDXJxK3ypGwoLbi28=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vcf5NeXVnnQucHFkuZ+CTDwt98BMmhMUIo9wVbrm8cNUe6ZKN
	Be/u919f/TliKxoRx1TPmkM5CFUQiTiWu+/7n7AHyn7XJWAa2zx+klCa
X-Gm-Gg: AZFdTZcjn9IWQpQcdPaC2JxEMMMGVbBONIfqNcT5n0Qow6AxYH+bcWLh7jSSOTReD4J
	IxMeUShrE/3zBzFedbFvmjx9C/gkXV4bqjJ9NnRBg2ltFCXMzgoBsTqFl/HrJbfwlgmBDjQOsHa
	oxLEsrv7qI7AXwE58UzRp/uRpHNCqvubIpsgnlb79rAweb7RkPITBkkyuKOzhFJDF/GFSkmxt/s
	cJe7I2ekyD4HhZeF4TBq7BfqSCKNcnnDfASzwcWrwn1vTE3x4sX8nKmwXMIOt42I5VsWACdi2Sf
	TJFj4pgr6JA1+jJTwzHF4xQjrIj+GLYUM6Nze4/u6LO08y4y2U/03HmXad44PFBtxJwIFFRKbJ9
	kZgdpmRD98z072QQBTO32M+B6ZZ315si2yUZRl4VD/lLlPBsQYG9uu/guhz8U9HSO1B+K5V3Ig/
	wfuR7GYjFdKxezbcmpNiKzdOkXWA8Nm88Vp9EOLx3//Vpb7oO7fsgSG4BLMBv//+A46U2FKxgiZ
	lrxlx3WX3h9i8o9w7LuxbGj8GiC8t7URa/OgA0O+Y6T9a+iKv3cxg3mg3R6qt07HbRoimK0yEd1
	MOhinVXck9cJdrmVh5UI
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id 4fb4d7f45d1cf-6ba37ac9214mr15694051a12.0.1795620041130;
        Wed, 25 Nov 2026 07:20:41 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm8131962a12.16.2026.11.25.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:20:39 -0800 (PST)
Date: Wed, 25 Nov 2026 17:20:36 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 4/8] phy: core: Add phy bulk data helper functions
Message-ID: <awb8ZycWk2PJzTUD@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:35PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Transient build warning due to improper patch splitting, please fix.

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
../drivers/phy/phy-core.c:1202:12: warning: unused function 'phy_bulk_get' [-Wunused-function]
 1202 | static int phy_bulk_get(struct device *dev, int num_phys,
      |            ^~~~~~~~~~~~
../drivers/phy/phy-core.c:1242:12: warning: unused function 'of_phy_bulk_get_all' [-Wunused-function]
 1242 | static int of_phy_bulk_get_all(struct device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~
../drivers/phy/phy-core.c:1274:13: warning: unused function 'phy_bulk_put_all' [-Wunused-function]
 1274 | static void phy_bulk_put_all(struct device *dev, int num_phys,
      |             ^~~~~~~~~~~~~~~~
3 warnings generated.
