Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F838B15E
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602084; cv=none; b=edxR+vMNjMKHnK6aqJdFWmntbK/iACjrkFshkfooxxJ+3vWzctG1DGwDT4rXTvDh55cL9YPIPlFSkyF8dwJ8h9sLf05VvPMYLLJS5FY9Zpdi1UrPGOyz6NFisCNvfwSmZOZBZmcEvSLE05K+Rg9MItG5wZ+tldaDgQIb5Em8Cc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602084; c=relaxed/simple;
	bh=12tZY4PaL83i6EU8eFJpcrtWtKa08X89nnhBFGLtCrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5J5SJHygbgn9C66Z4WFIW2f/eASWD1yBvG3nWRKhBx44KtuGtKIEAAGBpCNNNR20NuJGOduA2XoVJNIor8fnCzzqStX7UYUIXJuyF4KqnmLzb6aR+Q8MdJEIg4hq50A7bJYG6OcPYpZvSmvtSA8pf/X1EoMn4E3B6GmChwJBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjjmZzmh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjjmZzmh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d3b440b97aso4145ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787602082; x=1788206882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkXJaaW+TN+H71o3YvS6+97ZT70d7rkvuIJkAMJWpDs=;
        b=kjjmZzmhTnmMB6TbrlBC5BJSLtWE1TYfRVdEAEE7zSC3DhaP1huiE9/dQYoNKJSglE
         12Kl6dloC8wogKEZjjQ7PPo25AerPZgoAP08swK2T79iPxBizYrEXScHcw76xQM+51Zh
         iwMRx+Bbdy2vEag6bGlYW5WalEI8mKuEwBAeRK3B7LrijADYMenB6EuyxWhbabr3ktse
         BMPAdaC/gBAVUSqHwjovC4/sNMQZxxL395KI+I8JhnA79RGt12dWY65lsxSUFuhVoLro
         OY6O5UniW8Dd9EsdpyP0HYLLleWv7yWGB1byxdXssZdXHjMTH5I9Hxvn3WFLbrbAKrnQ
         wUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602082; x=1788206882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkXJaaW+TN+H71o3YvS6+97ZT70d7rkvuIJkAMJWpDs=;
        b=JYF2bUVvDZrCWqWKCRZywzPoFyMHEhwxT5lUdRi0x2+XwqmcyHd+ifXaJHQmvV9wx8
         TASSdJkhTz7NGOh+YCg1fWbxZBSY68qrc7oBsz/GCkQOSxgeNpIeTufBwTEiGFefwrS6
         OErqCz/o9taezZRpGBlBCrQ44/ibDmZy4LkxzvZyt9Bk5GaHa9/aSTda46KjDGkF5OHH
         2Mz+AsXLkh9uDnvQtyayic1ZhJ8YKRym8K20zuFAvbpxHsWWLWzaqxjqJ6M1mBYZJ4X/
         KyHVrzLICdA/mS7JvCxg7V7wVNe8xAwZhBpoPeKITU4ARwlDSp6CNiEPqPT0I8suDDhA
         h1Og==
X-Forwarded-Encrypted: i=1; AHgh+RrlTJEew1lPDwjbEBKu1cOuLr8hlAF8d/TYdE6E/KOEyDH/mkOJcVdBY8Q7ucc0km1sd6oywXSosu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nUuzWzMYJgZMcZAkzILTeISKNn2spdflA9ugXww4rz53C+E266
	nrbY34jrl++0A4VHI/o1rS3QpEg5IYE07K07PDg81ETOnmCUFs+9TCc6Wja9LTnCsw==
X-Gm-Gg: AR+sD130Bw1RZlPgG7rP6h3wrMORpSGzfmmWRnCD46uD0Pdfv7gc+ebll8XpG+0GeqM
	VN4d4sgU50gqNB/bX3GbbiSe795kguSqGXschib7hzG5c0eN+0xJfBeYVqnYhXn/xdlu8mhU4Yy
	ocINCvoaQ6rI88BzdhNv9q1ra1G8yW374h6xq3JWQ0DZ+u+9IaJ/FC+Y/mYDXRVatLcZUCP6qmi
	wYNJdz56W30lFPtdxK/mS51OcofKm0vLnyu9jpG+d7Omg2uuq75DGvj9G+lQOP+Hv7ut5X6G2YO
	ddw9QFXm+CRC5qeFZVzVsd/4KBRYnCvkZ9CLuwBSvGjVDzTsufYoBNfGErzh3zHs7Hj7+FjNPUk
	hKiJc2yArSl/L6sW3qDpBxHzoXIsWbEF6v7IY3xhIsLMc+bRxUNK0OQ4pUQq4Ku0monOJwsRutg
	vd85JdenK4LIlF/2s3LPMe4gCV99Jxr1QXTsDJNrFvHjxQuCPm97n8CCJ866xMrGDiZ47oTnPzI
	PUIrUwEgvpeqb+k5HNDL9wYhD/RsfPkNlwdsjFJMF2VtME9RzEf0K0ykS0=
X-Received: by 2002:a17:903:1a08:b0:2d1:1d3d:97c3 with SMTP id d9443c01a7336-2d6e088aba2mr1093055ad.13.1787602081412;
        Mon, 24 Aug 2026 13:08:01 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39642524ffesm371897a91.2.2026.08.24.13.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:08:00 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:07:57 +0000
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
Subject: Re: [PATCH v8 10/12] PCI: liveupdate: Freeze preservation status
 during shutdown
Message-ID: <aoykkgPM9UQue2qx@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-11-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-11-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:04PM +0000, David Matlack wrote:
>Freeze a device's outgoing preservation status (preserved or not
>preserved) during shutdown. This enables the PCI core and drivers to
>safely make decisions based on the device's preservation status during
>shutdown.
>
>Note that pci_liveupdate_freeze() is triggered by the PCI core rather
>than from drivers participating in Live Update so that all devices can
>have their status frozen (i.e. prevent non-preserved devices from
>getting preserved late).
>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> drivers/pci/liveupdate.c       | 16 ++++++++++++++++
> drivers/pci/liveupdate.h       |  4 ++++
> drivers/pci/pci-driver.c       |  2 ++
> include/linux/pci_liveupdate.h |  3 +++
> 4 files changed, 25 insertions(+)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
