Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5782E62B5
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994029; cv=none; b=pYt+Ak2qzQELtR1Xa+S3jEH2yZtoAkpVlyWWa4whkjqTNXGkK32OeB7BQWZTu0/K541whhQJsY1zpWUdtH0RO5f8YReVlf1WzvN2Jq+Y4LWCx/aI5oI5f8Iz4940y99QemARDeruWD3kl+Z+5pFtFE3Bp1DXkqjpoefB5OBNc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994029; c=relaxed/simple;
	bh=vqmP40l2sQm+jo5YrbdEYj98+Uk19D7cUQ2Z6s1E4Hg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AuMnZvOhuVrcmO/4xHC7HL5OAbfLmv7rfotxy85qj8tWCMrTtSqnVFKylhgwGmzhO9uBG8smQ1ZD0VuxHdKC8zhIDwuYKBRT2DgiNt7+dqSCoLc+LaN4PPdaAQdyY93x/EqDP/PXYQOLqmNKkbI8u3OMEZZvC3pl3CiMotjgBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRCIFICF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRCIFICF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751994025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tOAUOdDQ/Ohpve7MT0b5vBpxcHJyYUTcEvYHV9S4P7A=;
	b=bRCIFICF5XsB/oDIzgV3QLq7cWOFEO1eB6oaFo4PE2es3nSz4eq23x8cFne1RSd6XN515C
	Dsw7XhkkY0+gEdZ4e9LEVIdM+0OB02Gm+/JbFXVGBCCFyzcWssK+0btDe5Kdf1ba+YPhTk
	RYRiHLmpdJ50gvVe9fWJatfnjaYY7iE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-oq4s4OzlP-uiizlAW4IlHw-1; Tue, 08 Jul 2025 13:00:24 -0400
X-MC-Unique: oq4s4OzlP-uiizlAW4IlHw-1
X-Mimecast-MFC-AGG-ID: oq4s4OzlP-uiizlAW4IlHw_1751994022
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4538a2f4212so24684345e9.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 10:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994022; x=1752598822;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOAUOdDQ/Ohpve7MT0b5vBpxcHJyYUTcEvYHV9S4P7A=;
        b=AFE6w90pbGrwP/HScrpRm3a+jPsnPVfukko9Nr7OQvWwXAGJ7+ymlpN6NyRz+r5AZ5
         FpB6J+7elclNKyuiErPJ5AEnesjMOkEd4RN1yABy/vUkgSubH36+ESaK5P481ekb828y
         z4ochlo7zFW18rxxd7zUddmdBwMcQCYSzD70VQcV97HB/xrVn0rfhHlP1KRFs7YrZtFT
         AQFJxYFg9OWabpWl5P2LsdPFA/j0pgtJX7Wh/AaATjjx2uHPiNsWcw3oiXIA5v5x24AC
         Hmn0+gXGAD7Tq5HkiykmC5q6GpuruJiVnBfh0YQD7Emz1V6wAe9qLvtM7Gz9p018yajj
         wdmA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ogH1bh5Aq0hrfpMzoRdiO1cLsv/KvvLrYPSmRaEVoswWzj4rLMsPxwY9ytH18iaT99azXyMs/RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDNzwLybH5PaB0o5wVQF4NdkrMXfNGhK+VGh+Q3NpSVzk2Pc6
	P9NJ1DZgCE3Yv6HUDexxjTw2U3hLTTiJ/s4mRBR1xTzvzmLzVVNpSqVTdCGFU32XEVexhTpL8+d
	uUSbs5wIiXBPSa9yXB7sFgpvBnMaAbcjDBlXHX3onOL87ClP06XO6P9KBD0R8qw==
X-Gm-Gg: ASbGnctGldH99iANrvxnONdEAeevWGYKgTvjdDpttz+FKtNiOOeOA3tOFZzbyrcF9ha
	hltXQeNoREZ5Cw7v3fFeiuRg03K2yclYmDZxZhrUrVjbkO56LnzBQvKJLu4ToHxYJurIj2k1Vt1
	tIO0kdwB/ScqU5xv430ojn2Xf9kXVZKWCFHL3Dal1t9c6wVWjDtS7bnEo8+5tJqYux4WdIFtHQY
	JUA6NhVyBiwNXb0IhHcntcH6oIjv0LwVnCtFx8nAFgFHuUidER0V/xku838zb3LNp1S8VxQ3fKW
	GQDoENe8n31lAXZcjF0MgTVNmla1lBYGrv7Gctu3GlmWzT3WxPp0IVDL6c+0U/y9p1k2Tw==
X-Received: by 2002:a05:600c:1d1f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-454d3564b66mr5874015e9.0.1751994021593;
        Tue, 08 Jul 2025 10:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs2z8yosruby7WptbVhLXHCy2dc1fLMqvjmukcchZaNusQYuScrXtah/V+6PVdS+yzg4/ynA==
X-Received: by 2002:a05:600c:1d1f:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-454d3564b66mr5873475e9.0.1751994021106;
        Tue, 08 Jul 2025 10:00:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd39d0f6sm27320025e9.16.2025.07.08.10.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:00:20 -0700 (PDT)
Message-ID: <ef9864e5-3198-4e85-81eb-a491dfbda0d2@redhat.com>
Date: Tue, 8 Jul 2025 19:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 0/9] virtio: introduce GSO over UDP tunnel
From: Paolo Abeni <pabeni@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1751874094.git.pabeni@redhat.com>
 <20250708105816-mutt-send-email-mst@kernel.org>
 <20250708082404.21d1fe61@kernel.org>
 <20250708120014-mutt-send-email-mst@kernel.org>
 <27d6b80a-3153-4523-9ccf-0471a85cb245@redhat.com>
Content-Language: en-US
In-Reply-To: <27d6b80a-3153-4523-9ccf-0471a85cb245@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/25 6:43 PM, Paolo Abeni wrote:
> On 7/8/25 6:00 PM, Michael S. Tsirkin wrote:
>> On Tue, Jul 08, 2025 at 08:24:04AM -0700, Jakub Kicinski wrote:
>>> On Tue, 8 Jul 2025 11:01:30 -0400 Michael S. Tsirkin wrote:
>>>>> git@github.com:pabeni/linux-devel.git virtio_udp_tunnel_07_07_2025
>>>>>
>>>>> The first 5 patches in this series, that is, the virtio features
>>>>> extension bits are also available at [2]:
>>>>>
>>>>> git@github.com:pabeni/linux-devel.git virtio_features_extension_07_07_2025
>>>>>
>>>>> Ideally the virtio features extension bit should go via the virtio tree
>>>>> and the virtio_net/tun patches via the net-next tree. The latter have
>>>>> a dependency in the first and will cause conflicts if merged via the
>>>>> virtio tree, both when applied and at merge window time - inside Linus
>>>>> tree.
>>>>>
>>>>> To avoid such conflicts and duplicate commits I think the net-next
>>>>> could pull from [1], while the virtio tree could pull from [2].  
>>>>
>>>> Or I could just merge all of this in my tree, if that's ok
>>>> with others?
>>>
>>> No strong preference here. My first choice would be a branch based
>>> on v6.16-rc5 so we can all pull in and resolve the conflicts that
>>> already exist. But I haven't looked how bad the conflicts would 
>>> be for virtio if we did that. On net-next side they look manageable.
>>
>> OK, let's do it the way Paolo wants then.
> 
> I actually messed a bit with my proposal, as I forgot I need to use a
> common ancestor for the branches I shared.
> 
> git@github.com:pabeni/linux-devel.git virtio_features_extension_07_07_2025
> 
> is based on current net-next and pulling from such tag will take a lot
> of unwanted stuff into the vhost tree.
> 
> @Michael: AFAICS the current vhost devel tree is based on top of
> v6.15-rc7, am I correct?

Which in turn means that you rebase your tree (before sending the PR to
Linus), am I correct? If so we can't have stable hashes shared between
net-next and vhost.

/P

