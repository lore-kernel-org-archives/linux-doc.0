Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144ED39B95B
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447004; cv=none; b=Fw4Kp4HgBDLViZd+DWMKkLR1IMSt6ammef/Lrp1OLuvKANAeUjPR5cfRRYiUOQ5KaBu3Jl/HwaQgNCHWRAUmGzlhPYQMLx1CIASoAQMcktVpL42xgYasAYwiCpBl5JssNTE/c/1QZFEytz+uo+pfJL6tTx1ZiV6PWGspGWyVThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447004; c=relaxed/simple;
	bh=DxIjiuRLSsy1tFjfqwnUtZGdPPrFPa2emHdfIPwLGaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKUq//8CLnOJLqR58SJB46LfXBNAzq9if6Lw/Fe5Ne6wHqiIMfzvxCe7OfZy5VQNPcNePq5tKgbZdp6cRlRzUqtgOw/W2jkfs3biJSjhc/14s3tT5Un8XADf74lsbyjpGuARjNi7TTmAS/Llj2TmDbdpTl2UIOReAc6xS1BYauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=qejSHz/m; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="qejSHz/m"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso457411f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 02:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772447000; x=1773051800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyf5aAwmciBE7QFfA+/PpQQaPUYccIgX3fQYsSxVl+U=;
        b=qejSHz/mv7HaqVvybUq9mMdRh91/klcPbrp8m9TDyN6bXhHdCoYkRcI+r0+jbsLuON
         7V780DKi5GhyAkBytjq2KpvODxTn0X03VlsAQQpYS6py12jJWPQrJU7/rm3LBHu7lD7i
         UjCVZcSmmNp9mKBlkHOADSXgpl8s9AyI1yxAK1XFCzUbfbotkL1mOYOqvkD2AjRVQ+RF
         53EouXoHMx31/vSAx9ke/y4E26GeiroFmRLRGzYCSy169dWOQmA9ViMFPosIwtLRY8kX
         1mfWQ4UXY5lnssavO4yvfLH+vmR2Zt/3QzPiKwI8xtJiuEaxHRgMNv+JLyrRZdMDBTru
         SN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447000; x=1773051800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyf5aAwmciBE7QFfA+/PpQQaPUYccIgX3fQYsSxVl+U=;
        b=J5NGqkX2UICIWc+luYu9rwi4gUyVxtPKfBaOHTy5QfppBEMdzGD1+BI4Sqbor/SOgb
         c6KDX5P7qKNZ3u4v1LfjQt48Zzsm+s5iK4P0L2W7t4/cvVFQ0A+65ukIuMCl1zK46pNL
         yYEAGtqMxSMo1mIc/z/yuRN4ho7uc+uGWd3iVo7E88sK/RxYbsZmkLMt8aSWYMJjiDYb
         jyex4RX7jpkt1EUCyrYMYLkqNJQnr+xwO0IGJ5Mid0ZibWPFPp/ESKhIE21deU6/1wLh
         WIXNU/1Vdt2SmvHHYcPiJ6Uthg+jqpgkUcGwhNe2INlGlBqzc1JqVD4SM3rmA9oSiLYT
         FooA==
X-Forwarded-Encrypted: i=1; AJvYcCUOTOQl0jtRVDdSuISVjuuZyC5H6dkoXH6m/In3EYZg/FXcsNQw8V8noZdTWOOcYrDqNg/COLjVfgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKY2vgaI1T1jtJSKQlX3eMOFOsm6v2MM2q/17PlGKEud6h9cAp
	jPusjme7rLchmIGjopvb2HbYGKiD1qBhumUo2U9gcXSuuOmvr/Z10GKQyL1lPH5DUUc=
X-Gm-Gg: ATEYQzxljdQ2TTyn66/BG/Xggc9gaWSNQHGQVsZNCHhrkH684JelKUwqq4lMNwT5uGm
	hGzj6V+1GvTbEfDUcfv3ZUo7JzzhLhP0KYi/4eDQmLZPQnWE+5D0lWh89vw4mFC7N40Pent+g/f
	vHefqH2BytsqLT2ndDzqABEtCIqJMW+FQNwqui7pOmD4TUWfI7kjVAoQ0cc4KKVmj7bY1CVFNYp
	AjqzUB7erWb70sPZytwThMgPo9IZ4CVAgbRuj0nTG23do+IqL2DKB5I0P6kiRXC8+KntaB6Rb4W
	KiOACKWNuURvHDhlkDIoFlhYaETr+0yi6TAitXAO1mo8HwT77i+KoYrZaqfVZjK/mtl0GbfSfVW
	wZ6C0DNwWTAfYUojv4QYlx5qnk/ubhZlItJjXo1ogBDWQJDyhVyQs+8N5t2ziE3k8NbPrYS8KOh
	bsZa/CtKTQtnLaQGQPqtMCckY6gUu+eb4=
X-Received: by 2002:a05:6000:186e:b0:439:b374:c6d3 with SMTP id ffacd0b85a97d-439b374c7b0mr7633629f8f.32.1772447000348;
        Mon, 02 Mar 2026 02:23:20 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1116698sm12378754f8f.16.2026.03.02.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:23:19 -0800 (PST)
Date: Mon, 2 Mar 2026 11:23:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 04/10] devlink: allow to use devlink index as
 a command handle
Message-ID: <onwmw7ql5g2xqacrqnawcphdlzfu5v5ohgslsbvoeraszm7m4m@2ywv2ql37wu7>
References: <20260225133422.290965-1-jiri@resnulli.us>
 <20260225133422.290965-5-jiri@resnulli.us>
 <20260228144846.40f5dfeb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228144846.40f5dfeb@kernel.org>

Sat, Feb 28, 2026 at 11:48:46PM +0100, kuba@kernel.org wrote:
>On Wed, 25 Feb 2026 14:34:16 +0100 Jiri Pirko wrote:
>> +	if (attrs[DEVLINK_ATTR_INDEX]) {
>> +		index = nla_get_uint(attrs[DEVLINK_ATTR_INDEX]);
>> +		devlink = devlinks_xa_lookup_get(net, index);
>> +		if (!devlink)
>> +			return ERR_PTR(-ENODEV);
>> +		goto found;
>> +	}
>> +
>>  	if (!attrs[DEVLINK_ATTR_BUS_NAME] || !attrs[DEVLINK_ATTR_DEV_NAME])
>>  		return ERR_PTR(-EINVAL);
>
>If both INDEX and BUS_NAME + DEV_NAME are provided we should check
>that they point to the same device? Or reject user space passing both?

I implemented reject. I don't see much of value of allowing both. The
code that would do the checking is too much for this hypothetical case.
