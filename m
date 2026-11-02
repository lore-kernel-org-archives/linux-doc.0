Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623752;
	b=aQ+Vp2z6rYTIj+ifVMRvrpRZMN3KtQTB53Y3Lv8hIxgU5aQoHQMZZa8xRJ/89I8sm9Fm
	 dilHO128AFiUFVzEm9yLlenzTWs4hGh8++kMtANxu8+xmd+f3aAcEiQI6EYXRxazXJGih
	 t3Ag+sORBNF521Z5nIHWKf58gR9LnzOYQs6AKgucBX3WuVKfVRPJ66ePrKNtTVBiULrlk
	 THsQVooQ/k7zssYEbaJFbuOUc1K0vKmBfTTjND1zMhas3nBZcCaStchYXuII601C6hp4h
	 Xe2mb/ZgK0sXWCNJUSGwYfgpyNWm1mqqdJtbTByNBG7fDUchsavvgaDpwb1NEK12fag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
	b=cR+Y/PmZJ9E9dryf2/4ETT/FyXZ1/knvfFiHd1vJkVHuGEfDaTOJJDjyV+k9Wvb78t+s
	 uALZWEkJ9L4EjcFUZ2H7pJK8OlRzCe9/MNnVveMrcj0XaO++FXhN+dccvHcJu9aTstt5o
	 FeOrt82+94HNsCUzWtpQ6EQr/FxiWGJIfG1Qfm4EzXDmrNZZx3up0sF9qfif4R5MLtUbD
	 WLsPLSUDbN6lg/b38s5L1pWyBw0Dhgv4/I/6ns1NzLtTuhMAidEfcSktnUnrOR8fRFq9k
	 UxcRsOcWcwDM9SfZeC7pLp2azrfcIr8WXiijE7T0e99Ml1q6SIs93YqnLRNK8fnOpyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpuobCOD;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1B60A261B
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF1B60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpuobCOD
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2485091e87.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793623749; x=1794228549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=NpuobCODsaeMaWK3KSJ7CYeFzFjejBe/CdpSaMImxO/psFfYWNgksAz6IaQBHVoGnw
         yG4TCf9GwWszKn5P0wcTjS5/F7bSf5w6P8cLbEzmHkhdfS4xOg4xf7JMiocrxffE62mH
         DVHo0o1CX5jLPh/fOcr4yzR01YrMQb2/9QMO2M4askf2lmuroalMbTS/uP0jeYTWWaUI
         MeE6SgTJTPiWBhC9AUU5hmVaAXjzy50bPM6LOV17JjqC+4inRl/4yDJxVhRxuDK40T5A
         vGvZhmz6TCJp+zWhB42LV9spfusWTm3gQ9YT7of8ECrFocRAwvhVwM0uOZ6rJaD5eZkE
         XJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623749; x=1794228549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8NTQB3dN2QpIdebJsLSmUNNG/IYt0L9NmfBKr3dfDw=;
        b=HJWhW+2BBfjBi8B6JnBp8O7ZAjkDzMnsyH8LcNI8pFuQGEs/20yCLqoxPAzxM+zjm/
         2hTeqeZhRukw2cQNk4xcMtDdocFn9O2UAKn7iMq5HBaggLgEGmfhAbQbWqt27yQFC/Dj
         +RdJc4zF5ga6tGFlMe/4WpvwLf3tjtsBNJM/pidS7ympeEPhVD+KvbOtGYAJ4jP0IqMi
         F6ZQytcsXt7LNetcppCGyzXC28vyBlCMZZe7EIA2KZ+GBrJEkCFcSZDbrqxYNnoXtNq7
         0+/Mtx4tf3En9er98PnOgZ+TPCRGdTzX6sG49FC3Ed/RWSW/s41+y9/slAhm+atSTAf/
         jKtA==
X-Forwarded-Encrypted: i=1; AKwUvBzjH5wUM/kfkTGemQqV3cCSVVrJC9OURq6+7d56TpVDjdePuEUZ2dZGEPOnT6Zj7+cNdl9K1rtT5aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KGrF1qRCsJDwKsLfVWUPgB4O8T588U7xiSlRTcXysBzs/l9JY
	+hLk6CHlXcYa7LBlJ1pvwySfBHl+YKTxQ1Qcbj41VogRZvGxrRquiVe6CuXe9Uk/PNs=
X-Gm-Gg: AYBFou0cYqltXUAteiBpy+HXzj8EJH7n9t99j7wD8BEhGZHhEHXKET7Ed/ms4dCtl1f
	QqZrr1xlnarOKEfOW12U0gdJDXkswEDLlcdBX/4q0tZhhkP9qX/5FCBbq2XiMhEYsUy1I17y3aL
	FiV6/HZni8P3N/pdXxdjXF8arwH+74if0jTtVq44j8eugTaQXxEt1UJIj9HCjuTJxu0UhlpCE2i
	qIl0GwBGDbUpN1KOrrgyoWZ52TiM6I3ZDLbmr+WdkgOShGTv1kPtjMF2A0llBpiIa11Jyq1DxTT
	BMXaifFjGq4kZ3w8EMYGDsr4pIdl+1QK0PXyGbnAzHQQaQH/8mWITwBxv3q83mCBEzZYFOAss7f
	Wq8ubpBUTM0CUjcEA0DgttsDtAUomsfOtPFk0IyfLN+WMNzvvlqgbUtqmLutgoejim0T0xuVUVI
	QOUctIsGajKdmZYDNmbEOcS9nT8rJybwNcM4ULDj9lx9Q+zK5iUPx1MaG1Gd+B/PXRXbjZXRAvZ
	by3tdwI+XdwAuKdyRmwNrIBMOnbngnDXyLtnoYokNG/HDrIqp3/kJwzBVT9dCY0AqTTfHd8hJfl
	LlxaM66Dzl9ntjj8t/luFtCxBz2iC5jADUlq5rs=
X-Received: by 2002:a05:6512:158d:b0:5bf:e799:c7f3 with SMTP id 2adb3069b0e04-5bfe799c920mr1589103e87.61.1793623749527;
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04ee003sm1638014e87.7.2026.11.02.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:49:09 -0800 (PST)
Date: Mon, 2 Nov 2026 13:49:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 10/20] ctlv: Prepare event queue support
Message-ID: <auiGL-Xq72i5K8FT@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-11-jiri@resnulli.us>
 <auCbPdoaMq9oWoQ_@e129823.arm.com>
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
In-Reply-To: <auCbPdoaMq9oWoQ_@e129823.arm.com>

Tue, Oct 27, 2026 at 01:38:21PM +0100, yeoreum.yun@arm.com wrote:
>Hi Jiri,
>
>
>[...]
>
>> +int ctlv_event_emit(struct ctlv_op_ctx *ctx)
>> +{
>> +	struct ctlv_device *ctlvdev = ctx->ctlvdev;
>> +	struct ctlv_event_record *rec, *next;
>> +	struct ctlv_file *cfile;
>> +	u32 len, wanted = 0;
>> +	LIST_HEAD(spare);
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(ctx->file))
>> +		return -EINVAL;
>> +	ret = ctlv_event_finish(ctx);
>> +	if (ret)
>> +		goto out_free;
>> +
>> +	len = sizeof(struct ctlv_event_hdr) + CTLV_ALIGN(ctx->output.root->len);
>> +	scoped_guard(spinlock, &ctlvdev->events_lock) {
>> +		if (ctlvdev->dead_announced)
>> +			goto out_free;
>> +		list_for_each_entry(cfile, &ctlvdev->files, node)
>> +			if (test_bit(ctx->op->event_index, cfile->subscribed))
>> +				wanted++;
>> +	}
>
>Suppose at the time of here, the number of subscriber is 1.
>However, before calling the ctlv_event_deliver(), another task hold the
>event_lock() to register new subscriber. for example:
>
>
>Task 1 (emit)					Task 2 (new subscriber B)
>
>wanted = 1
>unlock events_lock.
>						Register subscription.
>allocate one record
>ctlv_event_delver()
>
>  grab events_lock.
>    Deliver former subscribe event to old one.
>    new subscriber B will call ctlv_event_queue_event() with NULL.
>
>When this happens, new subscriber B would receive overflow event
>via ctlv_event_queue_dropped() though it was registered right before.
>
>Is this intended? It doesn't make sense that subscribe B receives
>the overflow event in this situation...

Not intended. Will fix.

>
>
>> +	if (wanted) {
>> +		ctlv_event_copies(ctx, len, &spare, wanted);
>> +		ctlv_event_deliver(ctx, &spare);
>> +		list_for_each_entry_safe(rec, next, &spare, node)
>> +			kfree(rec);
>> +	}
>> +
>> +out_free:
>> +	ctlv_event_free(ctx);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(ctlv_event_emit, "CTLV");
>> +
>
>[...]
>
>Thanks!
>
>-- 
>Sincerely,
>Yeoreum Yun
