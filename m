Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB3409604
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998047; cv=none; b=dubi7cak/5k+CvbAYf+6za1LkU4foij/VFm0yeFtrVeB1+75NZ92Vs6JWhWXyrrGzAUifQI5G2PCbWs1kPgUUdSu0SLSiuXbFNRW20ajtes/jptht4btGd2v3Wx2o9Yp5iZVSTFJ/JQFI9vUIc/qgWYfPXto/FCLqSoCG9ghcd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998047; c=relaxed/simple;
	bh=5nqRxNakogx/4yPGbhMWXM6kLaEr4JRWCP596afBA2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT/peh9Ym8lT5S76kmqNR03hSOpV/YBVEhNL3r5/VXcVHieqIuiWR2pr3CKf3YK4OmwAtELVqO7+PqM2tDlRTk86xGjWWhTegdoPX1p4oQLNvBEpw1igmbxsARHmDVTjxJReh9w3Bo4vjGrKYfSi8PkSzWLifKsbFZuHco6MHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=X0lnLcaW; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="X0lnLcaW"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-516d78df76aso70541741cf.3
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779998042; x=1780602842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9XIwGoHI7koXT5NUKG3hqbl2ARW9TxartU/PZHOXcY=;
        b=X0lnLcaWT1GcFZzLbs7Qs492kBptPhA3nBkmjVFfNpgE63EzMdxs2oCW2VAGf11/iq
         ZJBGN5dX9l8m9w/t0vM0mEBE5PK0gtfnQa1G94Cr0j3eIom1weBu4F2t23fR69CSUiT5
         otX9+Hfz9Vq1RRZOGsEK9mj42FmgIqCYcsXHwZABPqkwyDeqQjGNGJgs7wHoWj6r87k1
         C1HQAR8h2Rm9hPBrGrlJoh9vX2531k+ocnGHqeEA3eYMx5u6SpXWt7ctPUCOmR16ueyA
         BSPd4kLKs6dpz94tcaGSYljt9kRTRaaAYUAyuLTvTlGTcIjwQemHDY6Iw6LCoS73akrX
         c1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779998042; x=1780602842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9XIwGoHI7koXT5NUKG3hqbl2ARW9TxartU/PZHOXcY=;
        b=Z8Icilvrhkk0bXM3sw7rIKjfgZ4jH6Z71gCXhy9aiQzori3w5DbYJkwjZHqD17YiZR
         U8IWX/RdAh7QNLzFBfjTHBKsq2trrfwsF/P0WkYb1yjdCwKW0n3WFS5hLzIgc4b1Pei4
         YKGeT6GOWyvSBWk2ri/0hMwAGHlccOjUnQFL/P7akY9z0gS+7eKsuqTQRvU23J24dsWL
         fO4sn/W6bJ6hJtF8/hJ7plDzvKiD6yRNCLqnj/TI77/osO5zlMLvU4ENdx2RtuLUC3ZY
         Ee6pNGmxAl083vwry3y2C0N2C5GJcbmRdrDkWSupus87tQEzaIrhVUDS8NEDRCKLjGki
         uZdw==
X-Forwarded-Encrypted: i=1; AFNElJ/p33Fxis6kwFm6gu9egBno5SSGiYK8cxhTYRA9wITKnLco2OSAx73lwU3XDlPCOK8mwo9xKDjKW/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVynpiUFBgnMrdKFpBfm71hy820pFZS5tVblWmx+d0zT6RGG6f
	50SVPsyUoDtiRmQjyO7EZC3nLLa7ULAVq1ppL0YlfCejAA15ADtjztMUObEYrO2BHTI=
X-Gm-Gg: Acq92OGLyBLwUNAw7sqSVWlj40W0HoYW/uL6BQ9fJe2wT+hBRY7A7224396DM/LJByA
	COSJO/t9eJRYPDXhsQcfGOwpjQ10j19zeCgw+6Su6/KaNhfs2VsidcZnHI+qOS8eQ3xjpEMZkCI
	gFAbVx8DN3Q5BeerrVkYi/yx6ITcKyxNSt4C3FzBqL9nFuAUT7kbWRm+VKQQYiXxeaPEJpD2FrH
	c0VwdwVIlHiBmhi0wc13cxbr5pp6w1rfmXSAP9/A8EmBK0fQ04WnOKUToQN4/do2GiPhGCq9F69
	r+M03O5XgpPLS0hAqZfhrzOLc0D19ofu7anwz3+twoovuyuzZHLeM3/NzoNJ16wyKItbcgMU6Wg
	l7unk2qwLixQwZ2LJ4XxD0q20CgEQPBUXT8tsrl3kbbyHb+Q8xiloRkCJBo8zhde2YdTYKNEWiz
	Q2HFOWTmZs7GCKuj0+swAdPCKCUk8IOa/ftzoWrH33XfhLORMtqPNfs1bAIMcmmw==
X-Received: by 2002:a05:622a:6202:b0:50e:5cc3:6f42 with SMTP id d75a77b69052e-5172cca732cmr3748581cf.59.1779998041630;
        Thu, 28 May 2026 12:54:01 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc63dsm85233251cf.16.2026.05.28.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:54:01 -0700 (PDT)
Date: Thu, 28 May 2026 19:54:00 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 01/10] liveupdate: centralize state management into
 struct luo_ser
Message-ID: <aheB1qJbwyGhQ5wj@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-2-pasha.tatashin@soleen.com>
 <2vxz7bor78zw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz7bor78zw.fsf@kernel.org>

On 05-25 18:24, Pratyush Yadav wrote:
> On Thu, May 14 2026, Pasha Tatashin wrote:
> 
> > Transition the LUO to ABI v2, which centralizes state management into a
> > single struct luo_ser header.
> >
> > Previously, LUO state was spread across multiple FDT properties and
> > subnodes. ABI v2 simplifies this by placing all core state, including
> > the liveupdate number and physical addresses for sessions and FLB
> > headers into a centralized struct luo_ser.
> 
> Makes a lot of sense I think.
> 
> But nit: this brings about a semantic difference: now sessions and FLB
> serialization format is no longer independent of LUO. I think that makes
> sense but can you please spell that out in the commit message.

Added.

> 
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/kho/abi/luo.h      | 91 +++++++++++---------------------
> >  kernel/liveupdate/luo_core.c     | 59 ++++++++++++++-------
> >  kernel/liveupdate/luo_flb.c      | 65 ++++-------------------
> >  kernel/liveupdate/luo_internal.h |  8 +--
> >  kernel/liveupdate/luo_session.c  | 57 +++-----------------
> >  5 files changed, 93 insertions(+), 187 deletions(-)
> >
> > diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
> > index 46750a0ddf88..1b2f865a771a 100644
> > --- a/include/linux/kho/abi/luo.h
> > +++ b/include/linux/kho/abi/luo.h
> > @@ -30,52 +30,25 @@
> >   *   .. code-block:: none
> >   *
> >   *     / {
> > - *         compatible = "luo-v1";
> > - *         liveupdate-number = <...>;
> > - *
> > - *         luo-session {
> > - *             compatible = "luo-session-v1";
> > - *             luo-session-header = <phys_addr_of_session_header_ser>;
> > - *         };
> > - *
> > - *         luo-flb {
> > - *             compatible = "luo-flb-v1";
> > - *             luo-flb-header = <phys_addr_of_flb_header_ser>;
> > - *         };
> > + *         compatible = "luo-v2";
> > + *         luo-abi-header = <phys_addr_of_luo_ser>;
> 
> While you are at it, perhaps also get rid of the LUO FDT entirely? With
> this change it only holds the compatible and a pointer to a blob. Might
> as well move the compatible string to the blob and use it directly. Do
> you see any benefits of sticking with the FDT here? We have already
> removed it from memfd for example (and AFAIK the upcoming PCI and VFIO
> patches also do not use it).

Good idea, let's remove it entirly, I am going to do this in a separate 
patch.

> 
> >   *     };
> >   *
> >   * Main LUO Node (/):
> >   *
> > - *   - compatible: "luo-v1"
> > + *   - compatible: "luo-v2"
> >   *     Identifies the overall LUO ABI version.
> > - *   - liveupdate-number: u64
> > - *     A counter tracking the number of successful live updates performed.
> > @@ -109,13 +82,26 @@
> >  
> >  /*
> >   * The LUO FDT hooks all LUO state for sessions, fds, etc.
> > - * In the root it also carries "liveupdate-number" 64-bit property that
> > - * corresponds to the number of live-updates performed on this machine.
> >   */
> >  #define LUO_FDT_SIZE		PAGE_SIZE
> >  #define LUO_FDT_KHO_ENTRY_NAME	"LUO"
> > -#define LUO_FDT_COMPATIBLE	"luo-v1"
> > -#define LUO_FDT_LIVEUPDATE_NUM	"liveupdate-number"
> > +#define LUO_FDT_COMPATIBLE	"luo-v2"
> > +#define LUO_FDT_ABI_HEADER	"luo-abi-header"
> 
> Nit: If we do go with FDT, I suppose "luo-ser-pa" (or "luo-ser"?) would
> be more descriptive?

I think, this is a good idea to remove FDT.

> 
> > +
> > +/**
> > + * struct luo_ser - Centralized LUO ABI header.
> > diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
> > index 8f5c5dd01cd0..7ccc59981297 100644
> > --- a/kernel/liveupdate/luo_flb.c
> > +++ b/kernel/liveupdate/luo_flb.c
> > @@ -159,8 +159,8 @@ static void luo_flb_file_unpreserve_one(struct liveupdate_flb *flb)
> >  
> >  static int luo_flb_retrieve_one(struct liveupdate_flb *flb)
> >  {
> > -	struct luo_flb_private *private = luo_flb_get_private(flb);
> >  	struct luo_flb_header *fh = &luo_flb_global.incoming;
> > +	struct luo_flb_private *private = luo_flb_get_private(flb);
> 
> Nit: this doesn't seem to do anything. Is this a stray change?

Removed

> 
> >  	struct liveupdate_flb_op_args args = {0};
> >  	bool found = false;
> >  	int err;
> 
> > -int __init luo_flb_setup_incoming(void *fdt_in)
> > +void __init luo_flb_setup_incoming(u64 flbs_pa)
> >  {
> >  	struct luo_flb_header_ser *header_ser;
> > -	int err, header_size, offset;
> > -	const void *ptr;
> > -	u64 header_ser_pa;
> > -
> > -	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
> > -	if (offset < 0) {
> > -		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
> >  
> > -		return -ENOENT;
> > +	if (flbs_pa) {
> > +		header_ser = phys_to_virt(flbs_pa);
> > +		luo_flb_global.incoming.header_ser = header_ser;
> > +		luo_flb_global.incoming.ser = (void *)(header_ser + 1);
> > +		luo_flb_global.incoming.active = true;
> 
> Nit: Not getting FLB data resulted in a error print. I suppose we should
> keep that here as well.

This is no longer necessary. Previously, we relied on the FDT, which 
contained its own errors, but since everything is now passed through 
LUO's own struct, there are no errors to parse through fdtlib. The 
absence of flbs_pa indicates that it was not preserved by the previous 
kernel (i.e., there is no flbs).

> 
> >  	}
> > -
> > -	err = fdt_node_check_compatible(fdt_in, offset,
> > -					LUO_FDT_FLB_COMPATIBLE);
> > -	if (err) {
> > -		pr_err("FLB node is incompatible with '%s' [%d]\n",
> > -		       LUO_FDT_FLB_COMPATIBLE, err);
> > -
> > -		return -EINVAL;
> > -	}
> > -
> > -	header_size = 0;
> > -	ptr = fdt_getprop(fdt_in, offset, LUO_FDT_FLB_HEADER, &header_size);
> > -	if (!ptr || header_size != sizeof(u64)) {
> > -		pr_err("Unable to get FLB header property '%s' [%d]\n",
> > -		       LUO_FDT_FLB_HEADER, header_size);
> > -
> > -		return -EINVAL;
> > -	}
> > -
> > -	header_ser_pa = get_unaligned((u64 *)ptr);
> > -	header_ser = phys_to_virt(header_ser_pa);
> > -
> > -	luo_flb_global.incoming.header_ser = header_ser;
> > -	luo_flb_global.incoming.ser = (void *)(header_ser + 1);
> > -	luo_flb_global.incoming.active = true;
> > -
> > -	return 0;
> >  }
> >  
> >  /**
> 
> > -int __init luo_session_setup_incoming(void *fdt_in)
> > +int __init luo_session_setup_incoming(u64 sessions_pa)
> >  {
> >  	struct luo_session_header_ser *header_ser;
> > -	int err, header_size, offset;
> > -	u64 header_ser_pa;
> > -	const void *ptr;
> > -
> > -	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_SESSION_NODE_NAME);
> > -	if (offset < 0) {
> > -		pr_err("Unable to get session node: [%s]\n",
> > -		       LUO_FDT_SESSION_NODE_NAME);
> > -		return -EINVAL;
> > -	}
> >  
> > -	err = fdt_node_check_compatible(fdt_in, offset,
> > -					LUO_FDT_SESSION_COMPATIBLE);
> > -	if (err) {
> > -		pr_err("Session node incompatible [%s]\n",
> > -		       LUO_FDT_SESSION_COMPATIBLE);
> > -		return -EINVAL;
> > -	}
> > -
> > -	header_size = 0;
> > -	ptr = fdt_getprop(fdt_in, offset, LUO_FDT_SESSION_HEADER, &header_size);
> > -	if (!ptr || header_size != sizeof(u64)) {
> > -		pr_err("Unable to get session header '%s' [%d]\n",
> > -		       LUO_FDT_SESSION_HEADER, header_size);
> > -		return -EINVAL;
> > +	if (sessions_pa) {
> 
> Nit: same thing about the error print here.

ditto.

> 
> > +		header_ser = phys_to_virt(sessions_pa);
> > +		luo_session_global.incoming.header_ser = header_ser;
> > +		luo_session_global.incoming.ser = (void *)(header_ser + 1);
> > +		luo_session_global.incoming.active = true;
> >  	}
> >  
> > -	header_ser_pa = get_unaligned((u64 *)ptr);
> > -	header_ser = phys_to_virt(header_ser_pa);
> > -
> > -	luo_session_global.incoming.header_ser = header_ser;
> > -	luo_session_global.incoming.ser = (void *)(header_ser + 1);
> > -	luo_session_global.incoming.active = true;
> > -
> >  	return 0;
> >  }
> 
> -- 
> Regards,
> Pratyush Yadav
