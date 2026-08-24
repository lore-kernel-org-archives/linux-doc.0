Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7F37D12E
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601772; cv=none; b=MKXV762bWIYhZAqshxdzGcnAgx7HgwDAi3Ff0bQiLKfhA55E7ct3e38H9rRJ2NuO/sJeVWyT6xwTNmb59baL37ukVg5V4SfSDjZvnY0j0XcIiJkhOcTy9V1JloNG5r6qgacUhPhamM2mHmGiXleCgLnY6d4BeCFsoB+YPRrE5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601772; c=relaxed/simple;
	bh=QQxK1dMYfMEITfED9pcxrpNSHfy8AiyMMu885Ozu8Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0+ogVcbuw4MHl3ZFolWRmMQ5qZfTy1iUIu1K1s8qvj+i95Mbcj3e+LSwD3yvWkUTbMG0bGxpsPzlTWb9Dc6th1ZHOY3PRnrgyu6q6HObVW6vSmEEDmI7Xv7ngwrbQr56Ype5IMS+7KU5e+vu8yHXK88JcxBsnnUilWfhpUSRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oeMbOAgg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oeMbOAgg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d3b445a84fso2775ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787601770; x=1788206570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JSlxwskXTbuoDvNvgTyyULaG2qnymU60jxRuo89A6s=;
        b=oeMbOAggQjWf7IPVMS14ZehmqgXssmnIKoCBL7r+wbrCvwQNO55N/Uq5k0qXf5aXXe
         uHAOADa0nWgt/kD1gYHkhwJFiywr6t3LDepiRtz2ffaNNqW+2iAumyHt72uLnL1UUu0T
         8qE6rkqgQNhZ/2Sej7aq8/9g7PsorWl1XGdWyK8ZD7dbGOZlaC1vNZKVswfgLhMzd/In
         qRdQgMvsdnOIcIGwfZaNo5JLQHQxWs1CnhS26smWS1C5z7jzFxauWjCfvBS6CIIpYSiP
         6gpPjuv/55lVo/PoErh99OiE7jNZX8b4TEloGvGDNEqCZ2wejcn9znBLbBmTDTK7lxNx
         1UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601770; x=1788206570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JSlxwskXTbuoDvNvgTyyULaG2qnymU60jxRuo89A6s=;
        b=Rn2Cnx8b+4Y7dT2m3O+L5D0mbOhY1/McmQPGHcz6Le2EFEOuOaZgvWJ0aSYLbZ0Pvs
         nsrTChNiJoQNkrqN/VBWCLZNYDfDhojcqNXit1gN7RCCjjPoOU0UNfSwwsiAv0wO9/4i
         rKVr8pdfr7BbbI06SXt8FjL9o0dgsMlxjg2NorxWx8GTvooe9QEbroqg7OdZrXF7d3KF
         qtXZK9TZ1YxOXFTZXDkpp+dL8b7xdynpVI78zZ7iIpwhTkXF79cMOnZ6Xb1taF6MXch/
         4fhOIlOzKF7jbtPtS1NIfy+7dw9FAY+Nsyiu1POY9L6Rxzvq4JGZJwOeM1ieN2FpG7kp
         99vw==
X-Forwarded-Encrypted: i=1; AHgh+RqnlihojhGb4giN4oW9gYRkqZAG1Baggath8BG/fpSj8lc3bOZCRvYq57E0WsDwV+iPoF1RIbB+VK4=@vger.kernel.org
X-Gm-Message-State: AFuF++nr2DzT02nIsDxjDtjdoK5GvwsxyFTUZZzrc4O5k9R5u8KpbAfJ
	p/KUroWdOzA11evqg87g30qdrqNwtlgS733absOA8CHN9i6NA0NTWYB4/uYXEHJ4fg==
X-Gm-Gg: AR+sD13QkpdbOrVBW+aJJSzKnzEfTX9IwH2TMoMknloYay4q0BFy/Cbvg84mBWtNmX3
	zG640L4QjNNS8xQXU8rzpx7sMGLAbQc2KtKloiYIB49LZkappI82LcSlk35ZMe/AQI504wARBgF
	WvbMxEegNLLIbXCo1pI8uDTlBr1aPt/AGk+OcImmqCw2+gBMguWXdF60pdvRlP7Ff6sX8DuA407
	BAr+s7G2XVpuCYYXwukubri5D/SgZkmXJ0xTsTUUE75ORRP41+GHw7bA3xYiT5Lj7BnZ2qwfTY9
	H6CfhOHw432W8aMrRfsOol08se4jFgzk9zsF7HD7rIJZwJGBbac6BcwhiPzkAVT+7kfHGn4DuQH
	sdI0DH/+9E1toM8FnVzknMeYghtiJAxS3fgnxt91ARNp3KmwBfs1cI67BM1oNdlrgqrt9hvGgmM
	0DUd6MaFRgEOxQJZlDXxTtuu8W0CRtF+tOMX7TIVSCLa3aZH1HHBiiRVLtOrd265eaWQd2wQ0FY
	Ouuzd2bhYw8H47U5BbJd4ye+SkKAasU0lreUBUQVWfntqyVwmAyPTzKcLs=
X-Received: by 2002:a17:902:cecb:b0:2d0:1aaf:daec with SMTP id d9443c01a7336-2d6e0830038mr894155ad.9.1787601769181;
        Mon, 24 Aug 2026 13:02:49 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645da08desm723671a91.17.2026.08.24.13.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:02:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:02:45 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 11/12] PCI: liveupdate: Do not disable bus mastering
 on preserved devices during kexec
Message-ID: <aoyjVL6sjG7xh9jB@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-12-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-12-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:05PM +0000, David Matlack wrote:
>Do not disable bus mastering on outgoing preserved devices during
>pci_device_shutdown() for kexec.
>
>Preserved devices must be allowed to perform memory transactions during
>a Live Update to ensure continuous operation.  Clearing the bus
>mastering bit would prevent these devices from issuing any memory
>requests while the new kernel boots.
>
>Because bridges upstream of preserved endpoint devices are also
>automatically preserved, this change also avoids clearing bus mastering
>on them. This is critical because clearing bus mastering on an upstream
>bridge prevents the bridge from forwarding memory requests upstream (i.e.
>it would prevent the endpoint device from accessing system RAM and doing
>peer-to-peer transactions with devices not downstream of the bridge).
>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> drivers/pci/liveupdate.c | 11 +++++++++++
> drivers/pci/liveupdate.h |  6 ++++++
> drivers/pci/pci-driver.c |  7 +++++--
> 3 files changed, 22 insertions(+), 2 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
