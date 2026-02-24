Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37991349B04
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921581; cv=none; b=i0h8R3+2EgNg4TeStPUsfIfp34KLvZpQfQ9yNjINGxRw/2CKneySfAVfkR9gcC31pqwUcY/xDH3t9SQPmxGoiA16UJhTel/hGUXVjoJThm4wCYZtwWwDnVqnz5OzQiGHzg5ypSGMXVUrlP7CpGOtYTy+3EhxKz6WE2LUL85bB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921581; c=relaxed/simple;
	bh=FtVWnKmSAhQscaTbVknx7Fz3wyNfwC/jGqjGpMz7VS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7K1iWsRj+/vDUAt4jvUqUwRAIxutbDPVQPfv3ESCr6fX5A+v45wTYkGNywjBTMoPWd+qTjxQ9BGr7rQCfn03JVg+SpwhCDOz9rUMWMWcTLRpM9eQZrPeN9d4akHGyZpINdCUNVTwPC20wmMlXeq4VlnriMVOWnpDN7m/BsW8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzspBYjl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzspBYjl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a964077671so69565ad.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 00:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771921580; x=1772526380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUKKSXBfGZuIEKcFLX2f8iJcwGvlTC3YM5y4lXwVnQE=;
        b=BzspBYjlzJho/96OyJYC3/gHlaMUuKjiw/QoS90zqVUIVPaB1+4cmFktKshaEN64oN
         zPGDaxiy7uah8Ty1NTrZSA56zwLNViSRrvAhU3CzYvYqHVtdE1JxUltMvAbg2Y0Z7iZ7
         oodAGSR30NSP8Spay1Qb9whhfK0FcfkaU68AU8wkjBFuJMQz/F2SQYIo/+QfFR2sVJgc
         55BgOqCT3TICyhtcjz0RFUkIHBBDi+vRzXiN0GVSzVMH8I297zVcjKCPk8KICUw9+P8T
         Dl94M4PzFks+1ul9h2UtYgullQAUdTVuz+swCqQpFZEs+fBWJDQD+bx+OeZfxxLBLV8v
         VNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921580; x=1772526380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUKKSXBfGZuIEKcFLX2f8iJcwGvlTC3YM5y4lXwVnQE=;
        b=wEU4Bpi79oNmcVZ3OpUkl+4XScPoEhyuYn3K3v2j26UnWLFC8X9NQwC2MAkqjVVkLb
         q4OwtH/XtszRFTMejpb/kSHsaw3EpKX2LO7nXVDjkT5xpshyeAMEMeTRhj8eZT0S23l4
         53YDwv3T8j9qmuWlhkXGclFTlHjTo62ujNwE8E3OrSaa7IO7KE2qWY5QvdYTday4qhAD
         QzRU7KCBimGJoaf3GO1oNslF7jUHrOM/A5ko5pzV+0Gw1a2ujMkXyvpnhwPMqFq7FnJl
         S/dMWrH/SbFMb95qc46L7g27iRMVqpLdIG4vy261B7K0Qg4fkoJGbrB8iswC4qkpWQbL
         B0DA==
X-Forwarded-Encrypted: i=1; AJvYcCVU5QO+Tsef47gE2EQug0o4sA28T/7mnLDUrE9jUP/GuRaLb10Zm9waNiF5ZRvzBTx9k2OdsyxS5d8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ikU2gqx/CahZtyGxOldkbftjEOprh39MX0EwhXWZapP1Iu6r
	8Y5aOcZK15HGqqXeYNW79Fkvey9rDeyX7pAiC41yZ3YltshjmkrcZ3fcT2VBKGroXg==
X-Gm-Gg: ATEYQzxze4/E/fRZZFdTUpbcNdNA+vs8ksVprHhqqyNfyC5o6apzaAyIY0pm9eaAwGM
	bWUCnZWPt/7ravrkNWQnlWrayDX6ByCyBFHFlhHEVEg1WNE0Tf+PRJEw1iiC72347PR4HJiZrse
	LTJfrXh5Tgw8INKJSpqZ4KTKdz1qD4FtV3CJu3vZAPI/y7RyHmajCdETB52tXbI2xgmzjkWa34D
	PoHuBv3Ir8x9JpXeyX5zuEr4smyBZygZcXtgy3LQw93Ba13n8yoG7pftrC7uPRDMI2FRIO3VSQb
	H1HVcbQNo50V4/axRwRMUnWMIWJc5GI46PGtEvMQXbrPxhoSd77KYAsHyyqO9So4yhqHJ76MKLV
	63MNdLv7q8/aFGpFzyMpBjvGtxHyItOY+hzAZmQeeCA1WRxznThKkUO9ul0eWLMCXNGzBc6hffX
	jxMUnuM2gbworxF+1FHr9awA9D+q3yweA7CVyxwRo1weqx81AX6plEgQZrJ6Bvu6QtkBFERqk=
X-Received: by 2002:a17:903:2f04:b0:2a0:7fac:c031 with SMTP id d9443c01a7336-2ad997f5113mr1474945ad.14.1771921579006;
        Tue, 24 Feb 2026 00:26:19 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ada77cc13bsm13228715ad.47.2026.02.24.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:26:18 -0800 (PST)
Date: Tue, 24 Feb 2026 08:26:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 01/22] liveupdate: Export symbols needed by modules
Message-ID: <aZ1goNCgY8xz9n6K@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129212510.967611-2-dmatlack@google.com>

On Thu, Jan 29, 2026 at 09:24:48PM +0000, David Matlack wrote:
> Export liveupdate_enabled(), liveupdate_register_file_handler(), and
> liveupdate_unregister_file_handler(). All of these will be used by
> vfio-pci in a subsequent commit, which can be built as a module.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  kernel/liveupdate/luo_core.c | 1 +
>  kernel/liveupdate/luo_file.c | 2 ++
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
> index dda7bb57d421..59d7793d9444 100644
> --- a/kernel/liveupdate/luo_core.c
> +++ b/kernel/liveupdate/luo_core.c
> @@ -255,6 +255,7 @@ bool liveupdate_enabled(void)
>  {
>  	return luo_global.enabled;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_enabled);
>  
>  /**
>   * DOC: LUO ioctl Interface
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 35d2a8b1a0df..32759e846bc9 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -872,6 +872,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
>  	luo_session_resume();
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
>  
>  /**
>   * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
> @@ -917,3 +918,4 @@ int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
>  	liveupdate_test_register(fh);
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
> -- 
> 2.53.0.rc1.225.gd81095ad13-goog
> 
