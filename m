Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381821CC61
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739447109; cv=none; b=btABGL2Y7bj+CrzTAxoKxnZbQCbAv2cSbTSI3/y1YI07r6dauMqa66NdFKs8qdnIyB/D9MPzLBxkfYYl9M+ocjgDucEUf1ROeY2lTfpkz8RC1pWarTy3Kd+45yaJkaPCN0hxrJPLk9I5uvoTjkxuN0aTpNjZgi10ppoR2mLfHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739447109; c=relaxed/simple;
	bh=z4FzBPhL+KmxxVmJsJ8LIv/mETG7bxy17DamwT8n4wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkgGc/0Ke8fF+d8gfu3euJ7Nvn9YiqdM4Xg00Tp/EuskOn7LbmeP8nxu0F8n37grQiFb2IeKISX7fadj0Q1uwU613OE4p35dmY19z6FcbfpTe9OguiKd8RKZP1qS2EQ0lGYK49O/g1yOd8PT2etoI9hcCsKbmTGuDRm7vD0U+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VjFAVDIW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VjFAVDIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739447105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ail4YrUpEYkDWqUc8Ez27id76e/8NDgaGRJNAbGRmo=;
	b=VjFAVDIWqVGzY3Flg3wGfXytiEYsiOj/ZI+HfZlpivGAsf5Tt02XNNZZ6ZqXUiB92BqRPb
	W94yjMCuVJoPoN+rMBZ8DNp8qEDvB0a9CLcx3gYFD/ewTIZUmp4MrTtseH5Kbq6SOZq9dI
	guQaezaeeOitVUP6ByHWDOf2RjKdxdU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-VBL2veAjM_aA5nl5VnpJIw-1; Thu, 13 Feb 2025 06:45:04 -0500
X-MC-Unique: VBL2veAjM_aA5nl5VnpJIw-1
X-Mimecast-MFC-AGG-ID: VBL2veAjM_aA5nl5VnpJIw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so5827805e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 03:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739447103; x=1740051903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ail4YrUpEYkDWqUc8Ez27id76e/8NDgaGRJNAbGRmo=;
        b=iaiBZJhQ8AFMvX+7sBJCK1+R3rpC+OYlcM3ncyA3OAp80JA2v9EBRxD1dgH+o7UFu7
         zSEqqvRxI2RYxZEnAvbKBrBpaLSlvuSn279FOM9VPHyPKEjYD8VUiBifwhGtEZ6yjrD7
         C266GDiQtAdEkFHsxuRf3ZTnCSG9t9NJocZ/doO2dMHGdhgXQBw+qnRiM9XYGaw+HeOp
         ym/3kr4gT9sUNSyjlbC3AC/lnYGxdm6uNCd857qd7mrt/JpnCAPz6qU1AbjqbKnPtL1s
         u6DocZy+JiMQAu0AtTNi7+D8YjXFgfemIgAFf5GJFMZG5Qgv6HvQccUxuYlAWNVaQ5fD
         s+vw==
X-Forwarded-Encrypted: i=1; AJvYcCVLmRb8h+HTFvZC4XnyjFlnzE6oQZkpwaFn+WgnI8vD/wUj7G9BLsqo3Qaco0rdeyXkKl0ubFdXf7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFpo15WP48vWDXHpE8MU2scdNB09+fdL9OsK1ENatn94zjD2P
	/cn4yE4f+wLMlRFquK1RFgaHYDvsIjcZ2bjPeP1UlTP5OTggZyz7QriNla6rqTD1OkREK3NsFET
	ia9PLV2ttejtmhoT3HHc3xeiGXQl0eNLp2dq5czuontssaAg4LnaKjd5zSw==
X-Gm-Gg: ASbGncvQGGhptdnd5gJlUeqY9UkZRXqr6b1aVne9w+m3+qGbPRqXs8LBS6H2gWPiz4q
	zru2gDoRkq1VpO34U3lamqqyTomnBmSG1WJFGF9Og6m6ylBkh3n407IrToGMk/60tKoiCYI0/I6
	sAXyn6uVAxwwmvjU/2WU8y4iJPULeMsT6CXd8Rfsqv1JaCbLsMv/SEJfZguk7f9FGlDNXa2300U
	X7C4l/pBuiPda02NKzGKR6bl1j1g8bAODh3xGiA09kbnabLbNsw3jyC09QseSWjZ6jhsVdNXhcD
	c7zoxEjgyUxn7bF22DKtfb0wSdwC00vzsEE=
X-Received: by 2002:a05:600c:3ba8:b0:439:4832:325f with SMTP id 5b1f17b1804b1-43958160560mr57564855e9.1.1739447103152;
        Thu, 13 Feb 2025 03:45:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsSaO9nwngXTwOiOIOnC4gfeygnFqnmDRDuBNDDrC1cNijFS2fay3xrPf6j87eCOO52vmu/Q==
X-Received: by 2002:a05:600c:3ba8:b0:439:4832:325f with SMTP id 5b1f17b1804b1-43958160560mr57564445e9.1.1739447102713;
        Thu, 13 Feb 2025 03:45:02 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617da91asm15645415e9.2.2025.02.13.03.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:45:02 -0800 (PST)
Message-ID: <013921c8-1fd0-410d-9034-278fc56ff8f5@redhat.com>
Date: Thu, 13 Feb 2025 12:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] documentation: networking: Add NAPI config
To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org
Cc: kuba@kernel.org, rdunlap@infradead.org, bagasdotme@gmail.com,
 ahmed.zaki@intel.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <CALALjgz_jtONSFLAhOTYFcfL2-UwDct9AxhaT4BFGOnnt2UF8A@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALALjgz_jtONSFLAhOTYFcfL2-UwDct9AxhaT4BFGOnnt2UF8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/11/25 9:06 PM, Joe Damato wrote:
> Document the existence of persistent per-NAPI configuration space and
> the API that drivers can opt into.
> 
> Update stale documentation which suggested that NAPI IDs cannot be
> queried from userspace.
> 
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---
>  v2:
>    - Reword the Persistent Napi config section using some suggestions
>      from Jakub.
> 
>  Documentation/networking/napi.rst | 33 ++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/networking/napi.rst
> b/Documentation/networking/napi.rst
> index f970a2be271a..d0e3953cae6a 100644
> --- a/Documentation/networking/napi.rst
> +++ b/Documentation/networking/napi.rst
> @@ -171,12 +171,43 @@ a channel as an IRQ/NAPI which services queues
> of a given type. For example,

It looks like your client mangled the patch; the above lines are
corrupted (there should be no line split)

Please respin

/P

