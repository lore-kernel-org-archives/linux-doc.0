Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176351F2C58
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417090; cv=none; b=I9gVq8kPz/zR8srIJ5ZFjbj4QSldT/thZnWJATe0X8rVITjmzeimLsoEkI+q8BSbr4q2KhfTU9VgsZ1JssRelXRnr+26I9vsj3D1w3mz4eKImnUU78W4AM3BZFI2IRNRI0/xFrFnPUN7/iz/AG7nSu48LoCsJEe5UrU3X9arCBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417090; c=relaxed/simple;
	bh=6xJQzx4C9XKRYxfQfKcV+U7e1I4Iv7BNohHvGevc1l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bx3Nes0BJ8GIaMSUoGQ8wl43S8KWYQxsKOoxMiserkEvrWDE5auGEGrPKmg26SZUoZRXjBte1Kgmv4yZH6yaVEf6CoO0Aa+AJ+JRb8PfvaLyMBeGuzEwPma5ion1IKDjJ9J4/QV5dOwjKPElXWhatgLWeMY3c3KGkZJl0HGIeaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ff6Tt3Wk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ff6Tt3Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748417086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6XYHyB+9SF/Z+X8QKiEUWQZQ80MVzujdD87l+S5+Um8=;
	b=ff6Tt3WkDfS/WEuuQYI8kxdyNwFSZMOSvcGPDm6CZsAP2i1rvkwkpi6o+K+e2gbjoN2SwN
	/9cqQXQj9Dt6VoK9YwyREchpeDFjjgO/QHRaq51MyX8kiygMhzWEcfuXiW8OdtmeuUMelY
	uzRUr8xqOU1YNPopnODosrZogkDODmo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-vJDF9olqOK-URjtuKPyYDA-1; Wed, 28 May 2025 03:24:44 -0400
X-MC-Unique: vJDF9olqOK-URjtuKPyYDA-1
X-Mimecast-MFC-AGG-ID: vJDF9olqOK-URjtuKPyYDA_1748417083
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so30985495e9.2
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 00:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417083; x=1749021883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XYHyB+9SF/Z+X8QKiEUWQZQ80MVzujdD87l+S5+Um8=;
        b=xL66PwoC3YV0RYFxoPZQFc+woNMdbKPbqYx4lyGnACJgHEeA/Nbt0qQd19hTlEPNF+
         hz/sloX/dUwgXzkDDkYF8Fn6RBU37k4F7NhdVP/8TFXDxcuE4kZ5JxMkCAbIsdtDir/7
         AL7xNN44YcpZRI6fXIHMF+WO2UAHmn0vfQ8u4ssnE0Ci8cQqszS3fXulODUn14PjXPbl
         Ai5uNPq0vDoXdi2WH9hebXjlt2anp1PJ/2oTILUaj0/bOuTj8PY48asq7UtTRv/5Ltoq
         lD/RWpy/WCmHBvzKk2HZHxZ+PIZP5SO+pG+LZvZFSW7Pw/ymvuJdzQ5Rz4rw+mWnuQKA
         yJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi8ldL2xf6x+W0lHIr3I60mIdfuK7CpopX+HCjP0RadL5BpmdgeWKbhf7c3ib9AwMnWOeptE+NyA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwADWuXK9vR1Ahgp4ApRRRlb5/C3k+OrotGLjkwVym8mtn4sh0D
	bnzS9vCm+2xfx1bRAuRxR/WZQlAWLcFTUpxaFJYRW1lLRJmilHcTeXsAGgwD3QSzK8sy6DUXB1W
	yqmSe4f4Rlb56IlAnSA1GG1yCO2YNc7HR3yOchIN3VQCkBzZfaGCLajZyGhjN0Q==
X-Gm-Gg: ASbGnctyQ5wQYwbp6i4G2GXC9loIUhxpFmpA8XF4uK1TACOe15lg7begMM1iB+6Zcqk
	e93h6hYvmOivzJdNg8lxfEDeElNgq1a529TgSNfaoAYGMemnuGtw2mE+uvWhRt6xMWOnxTXx792
	+Eg5NdkgbwwNZF8mu8IJHei0yqt2YOc/ZVf8lJimGIyd7TjoqUsrUjRthgI4x5vCiq6PhGct+5V
	U5UkISlbA651BdmBHc3WrFdxvDOsTXiJj3dmadEU7pZgr1JRfFzKl/IimJUeUNEe+n+L7Iwyv94
	pWtdHGimdVw1fSMoGD3B+RB/ztRl91zibS4s4RBaEie2uDBdEMk2OWfN9kHIs5EEtddE+w==
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr46892675e9.20.1748417083452;
        Wed, 28 May 2025 00:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqE1uwRo600JGmvrx2hbwcJjRSG8+fqxy1BRdw24yujy5GkHaEMyOu3ekjIht4ITlGdwQlA==
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr46892395e9.20.1748417083030;
        Wed, 28 May 2025 00:24:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae775sm11977185e9.22.2025.05.28.00.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:24:41 -0700 (PDT)
Message-ID: <dbc34cfe-c788-46bb-bd26-793104d887ab@redhat.com>
Date: Wed, 28 May 2025 09:24:40 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/3] dpll: add reference-sync netlink
 attribute
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, vadim.fedorenko@linux.dev,
 jiri@resnulli.us, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, aleksandr.loktionov@intel.com, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 linux-doc@vger.kernel.org, Milena Olech <milena.olech@intel.com>
References: <20250523172650.1517164-1-arkadiusz.kubalewski@intel.com>
 <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250523172650.1517164-2-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 7:26 PM, Arkadiusz Kubalewski wrote:
> Add new netlink attribute to allow user space configuration of reference
> sync pin pairs, where both pins are used to provide one clock signal
> consisting of both: base frequency and sync signal.
> 
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Reviewed-by: Milena Olech <milena.olech@intel.com>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Same reasoning of the other series, please repost after the merge
window, thanks!

Paolo

