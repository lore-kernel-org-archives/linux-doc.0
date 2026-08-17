Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B4468C0F
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986976; cv=none; b=RZdbAhyacFRR9oIb4MdYlEa669nLSMXnMSpuKVyxIoeC2JultUKIs4FjtyWidC8sAguol8GabmbIWpvixAO//exKSC/gHAGu//DU40mVnIngK0JMHf4Oz7jVZ3CSyjiHSZkEGCE1BTbj/hKD2zcKk44oFeZkkf0iPx1yfduCxXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986976; c=relaxed/simple;
	bh=dU/hih0hnP3rkicxnLGzGzbvz5NWJvf7JF/NG7uN72w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX5kKpRFNaqfumduDOWSPQIoV4tz8L70lbxSRWa7tFxAifDIIHnMqAAu7N2ep/X+lqHPiQ5PndIBoX+/7mw+FdxdbKPeXKqBzEH4kLXXQG8ZaLyk/vKOpjdsoxvQm7NFekjRHzp+DwUTTtpHEO9I3clGzTGqFeLbHS8d5VvG/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+YgIFNg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+YgIFNg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe377a217so2511364f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786986973; x=1787591773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=h+YgIFNgmLvUPawGDcpX/VQjV8o3Yt2E2k/+GEbAVjy1f6f+LgDPihx+bHXKs/71+/
         JOFKCGeqW6m+2BqIC9P/r7xS1YsFvY8g7sDQDBEVRev355OvMgFTSP3zLCmGMREcTz9M
         j9TlTTmDojGAdq1KDdexOZnGGM5LBYESzZrqynJI0NROj6Sj34sIpa5TXGvF5WLHdfTI
         DZLdFf1L2dKW4Z1YBjcaWUIcSI/j5ZMeH09kxmYle5QbyLWNX3jK8r70QtETJdNt7L+q
         g2x4BlX6MMf8u7mDRzOOWee8aLMf+NFN5YM1L1Q3kTiqJ4iwdXg/boZ3AaF+0iEkB8T0
         PWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786986973; x=1787591773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=UWxOmDBcudfpTBmJbcNoDhnjqLxhmhCIPYYr27MkZIb/jCua6e3mlXsiPXS9a7q59/
         6FyJHa8RpaLBt75+vYA8rp9KM7p/crB/tXTohEj4ZSLlL3Ukujv96EPjV4uaSDe33fYP
         AH8ogLmi7mGS4l9weOyBHi8h/HZavJSW6We9tgGXLvbWAmmLJoqb2Amfbv+PjxJYjuq7
         X1LO4KY3icguLN+yYCaqCpc2dmdILkl4eBs3YcZhijldxKhs4eyU3Rb68tgYk56Ej6/J
         efv+AhPil9yjO5UrF9bkRbW0bwa43DWPABCkuB/nqM92sfO6Qp+A+wXdf31kY09UA6ny
         damg==
X-Forwarded-Encrypted: i=1; AHgh+RrGi5cByZS6VBDK5F1cqUkun5cNEXiVRfqj/tHHpKgmMwqLc0kYnrxS15lbqSOlMmKzDYwXGjmkjM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVT6FwcPyy4oo41/CmdTkh0UUb1FoWXyavdI5IblbL9vceivo
	OGh3V1l4bSWCsGFviBJbT7CKN+FNTgJdBWTxmIeQFmf/YXt6cL1i3V50
X-Gm-Gg: AR+sD11MhfYDBWv3EGBGzdffCZnYq3GAgnyNAQHUCe+dbcE+sWIiCcg3JBajniXfAUg
	d43ziSMaMphVb4qm3FJNy1fAotNMBhw1o+yTMckEfTZv5EmvxPF/E4/RNoXdRh42VpnUR/YrLIs
	q1GcsmrAFNlbGMsr8bNB+yRZeksgzEnk2NLNeWNowMiPTXGyzOzZwg5dIh7MFwc8AjgRKq/InZ3
	KGh5VSVrooa8ut94p2fhtvRdzN7JF2I7Ldfi3BY9qtckDayR9i2zBq8TDiUbfsDvPuOjPmq+LEJ
	Kagd5F1LQ1q+FONlJKd9QRGAj0c3azbIix8ebMCVpn/hS/+8OOXN+nhtL1A8Wj3AFrdUI1DTGCF
	KXnEiSbBGzj5XPgCjhmKaJZ7Q+AXrL/ZzkH3ZVHYNrQP1CuEA6EcMbl8QV/CS9gBKW5oDWY1kg1
	jnuOMPxxvIJ5ZgxpsoqDdc80DrF/OdA/5NIHrjLMBeiFBiPFfm54AGzepTyeFTmuq+LtI=
X-Received: by 2002:a05:6000:46d7:b0:47f:9aef:5515 with SMTP id ffacd0b85a97d-482a9002c0cmr2267004f8f.13.1786986973156;
        Mon, 17 Aug 2026 10:16:13 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783d1sm5445518f8f.25.2026.08.17.10.16.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Aug 2026 10:16:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 19:17:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: frank.li@nxp.com, corbet@lwn.net, dmaengine@vger.kernel.org,
 hch@infradead.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lizhijian@fujitsu.com, mst@redhat.com, rdunlap@infradead.org
Subject: Re: [PATCH v2 1/1] docs: dma: correct dma_set_mask() sample code
Message-ID: <20260817191731.104171a3.michal.pecio@gmail.com>
In-Reply-To: <aoMty9Dvt2bnWm74@SMW015318>
References: <20240401174159.642998-1-Frank.Li@nxp.com>
	<20260816071044.331a2c51.michal.pecio@gmail.com>
	<aoMty9Dvt2bnWm74@SMW015318>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 10:50:35 -0500, Frank Li wrote:
> On Sun, Aug 16, 2026 at 07:10:44AM +0200, Michal Pecio wrote:
> > No realistic chance of the dev->dma_mask check (below) giving -EIO?  
> 
> dma_mask is pointer, which already initilized by bus driver before
> call to probe.
> 
> For example
> 
> https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L634
> 
> If you find one, which bus driver have not init it, please high light
> it.
>
> > > dma_supported() will call dma_direct_supported or iommux's
> > > dma_supported call back function.  
> >
> > Aapparently, it may also use some 'dma_map_ops' and there is a bunch
> > of those spread over drivers/ and arch/. But I gather they are
> > expected to behave similarly as the functions named above?  
> 
> I grep it and checked at that time, all return 1 when >= 32. Now more
> powerfull check tools avaible, you can double check it.

Thank you. Sounds like it should work then, though I think that
checking return status won't harm, just to cover unusual cases like
regression in some obscure arch or people with buggy out of tree
patches (which they "forget" to mention they are using).

Regards,
Michal
