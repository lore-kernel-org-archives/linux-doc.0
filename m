Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706820;
	b=cRDjLfFq9PvDx60GKwkjLap3pB+BK1pzCa3HfnIZdZGrBMHhhSt4bvn4HB0tLGqcZAeA
	 Fvf21AR2lNKudvCIohDIu5xU87aSJq/mAPLsF63x+DY9CoHQTtoFhLF2SJJ2ayRq3YwFv
	 KOUsAo9WCPLmclbJYDi7m00XIqu93L7zCTyWZ8OVr160DwkYQc3Rj2s+hbXXoSBEaqAoG
	 JDy8O2mfMCV148rvH1mKpevVz6RRgoTT0DIP+ppEsa60n33AXzaouzfAz1tdNYb5j/Bla
	 K9A5eVYk+aiVrna41XUIlIVf+gXgT1mQRhE826//W9P63D6UJu+zks59fRmcNmb3umw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706820;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
	b=IGylsgwIYIxCFt76UzdQPAaVfRuEfsSgyo/eXUtvQUcPgkUiNRnIXsz2F5OOneR36Lqg
	 romEK61GawVDBnyyfl6+d2uY3AizDeU3zxpor9ivMZujbYUS5Ut8hL83OtjjgJ1OLoJ/q
	 x/et2P3k46U2Xeqw7De1pREKBeH7iCsVNGaUi26VwBTati8U6ONyZDDOyOwNqFfxIJjp7
	 ZIc2Zc6iut1rbUnfBhjZAC+ajudYdaddhiUcQSTcCRZjwY2rCGV3B8dlyiad0TwJJ20k1
	 K4Iqwk1uYHsFWZYpUxoW3lkKsHvKPwcLkDv+LjQhr0v0owlkR9P9/PUWsTrrrhQRaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCrZ5VBk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pxkb3M5+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E48606A324
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 11:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E48606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCrZ5VBk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pxkb3M5+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793706818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
	b=RCrZ5VBkeJrEI3zpbneAS3YtxrvnJPz6jqN9FRXDVhfmLLcvfaSD23oTZTkgtK3jYosBNp
	EpAyzD2gXDZbssS7VwbzQq1WwdmvqGkLPfMAMixeF5l1effholsv0LTKsYmYX7C495MF4E
	xp50fcQyPwS5EKnGcvOp41O1SAp9Ilk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-CC4wzeAoOOC8RXTLtlH7zg-1; Tue, 03 Nov 2026 06:53:37 -0500
X-MC-Unique: CC4wzeAoOOC8RXTLtlH7zg-1
X-Mimecast-MFC-AGG-ID: CC4wzeAoOOC8RXTLtlH7zg_1793706816
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a210f93860so21905935e9.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 03:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793706816; x=1794311616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
        b=pxkb3M5+jKJ5wbs7oU3smOLAJR0B6GAGF9VJp0Mw5ip2B3kaMRwLgjDffBTnG2qcUf
         ANIa5eg2SRqOJETfufTBcJX9VTQaNkW3IGztKG66tFWAMTnDwcppPhNfzU4ZoL3YDlJj
         tZEaoeJ+fH0CHa4PF7RoIgk7kTPU5PIHeCTtMoNI7+8qwTm2pKMXdrjTveTCE1f5ZcLI
         XUhUzHC6mLCYmeVA8fiqsNYtSbMrgNaC0fZZ7XDNQDhp39Mc8BrbOBjYXDuydC5+I7Vs
         aKkuTmCNJzm9b93gICtBr+0b81E2MeB0eSuliOJOuV94rvAzLZdR6O2IrrF3vQOO+dSh
         d6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706816; x=1794311616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1VZgX116yiDi0nv9m0RSUyvLqFAqnWDdWQwCFN1ndQ=;
        b=kucDYuavRI6KwxrBEIUaiJAIQbysHIblkb3ZNmCCN+hIGOebMAQA1U1BNCIlEXwsSc
         GtD3Gswu+3CFDhMobzANWIycJD5keWmb5rCcdzC7O45SuU1xSvtWtKGqPXzytojug9Et
         mAjPKFPjbctp2LP4IxgoMB9UKqgjo9H9ro3nOfyubuojziVA+PytgH+ueXXDHedtvqww
         dYq+LAQGA034bcPhZfp26XwEeSR0JHnrM/AzLjrC9VXIyI0h44Wva9dZYxG3inmhEV9D
         kvRC2kClpkH9d9J+/J5/QjPspiRtjtvfHAX+jccehGByMM6WNFl4M3DgB5gChl+/opei
         Y7Pw==
X-Forwarded-Encrypted: i=1; AKwUvBx4EIcaS0mnWypdTuxwdpGHyr9eggrjbfByPBZeFpuM9104TpycwCcFP1L8XKe/396865zPx0pvP1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pw/CDdhhDFyXY59nQFrlWzbr8WSIeVwiqmLVMBntVbHXyOtXD
	el25mB/OLUgSNryFscW3rgN7vBT9x4qi4j4Jy8SQjRSNVOTC0a5ZMnPu+O5+kusaWcLcIDaY7Vt
	WpH+yNdNRaDm5YLgXva4ibaKzsn15VJrrV8AQooLmFCKe3cQwvohI0VtArsvVTw==
X-Gm-Gg: AYBFou0xJE65P6gcOuIk6hg5QWi+wZAa4jlLTFzNCmbEQCp7eE3YifmIZJ3qhOTwN6n
	aNUce8omKMqGt0APq0N64oLl/KJWdev0z9qGP9Q6Y0EBwsU59gRIwf8fN5hm5VQYT1BpF5mMfPW
	zgbuvTyPD1e1x2BFh8diS2tGRawLLldry4gc9tjrr5Rn1AOVZfA2SCQHpqljWMTBT5Wjsb9qssU
	EWXMve0mt/KGAenhC4i9UmCDNHvYS/0xvZbZSuGXKePKJ+owEahr2WhwZsXXkqdNgPlR7bKtpbX
	hQiVw7IqgXkX2AhG6IgPjjMdBtcLLNWHaqaCVB8pU34ppXnuatcGXZeDjtz0FeBZqVEKDepJV1g
	3+dbjVL5suwg06TjXFJlZyazLRxtU/03Hn+cuMqgBT2IvBYBdYasHV+Tu3pRouNmOPJ00XdlXmV
	s9w4mpSxEKOsD77Cvke7dH7rzUGlv8+2Kugd8+kdZF9Vo=
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr198293725e9.18.1793706816218;
        Tue, 03 Nov 2026 03:53:36 -0800 (PST)
X-Received: by 2002:a05:600d:8082:b0:4ad:181a:4348 with SMTP id 5b1f17b1804b1-4ad181a442cmr198293465e9.18.1793706815812;
        Tue, 03 Nov 2026 03:53:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm446661025e9.1.2026.11.03.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:35 -0800 (PST)
Message-ID: <02113612-0c7d-40af-8eca-043f5801d7ad@redhat.com>
Date: Tue, 3 Nov 2026 12:53:34 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] docs: netdev: try to force agents to disclose info
 for fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261029153459.2257998-1-kuba@kernel.org>
 <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
 <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
 <20261030093418.2fbf0999@kernel.org>
 <20261030164758.GD2673734@killaraus.ideasonboard.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261030164758.GD2673734@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 17:47, Laurent Pinchart wrote:
> On Fri, Oct 30, 2026 at 09:34:18AM -0700, Jakub Kicinski wrote:
>> On Fri, 30 Oct 2026 11:58:17 +0100 Geert Uytterhoeven wrote:
>>>>> +Coding agents must refuse to write the commit message unless they know
>>>>> +what discovery method to include.
>>>>
>>>> Maybe make it more explicit, as the sinfo bot will ask it anyway:
>>>>
>>>> ... and whether it was reproduced or tested?
>>
>> That's already in the existing text?
>>
>>> Which is true for anyone, not limited to bots...
>>>
>>> Do we really need "different" guidelines for humans and bots?
>>
>> Looks like at least a half of the commit messages today are
>> bot-written. With the existing guidance the bots don't add
>> the requested info by default (presumably since they don't
>> know the information). If this patch doesn't help we may
>> need to add our requirement to coding-agents guide.
>> They seem to be reading that one fairly reliably.
> 
> Is there no way this can be tested without being merged upstream ?
> Tweaking documentation in semi-random ways in the hope that some of the
> changes will have an impact doesn't seem to be a good process,
> especially if it's to work around defect of tools.
> 
> And unless I missed something, I thought there was a general consensus
> that documentation should be written in a way that doesn't reference
> agents specifically, as the same behaviour is expected for all
> submissions regardless of how they're generated. Has that changed ?

Please note that the networking subsystem is consistently overloaded with
AI generated contents. Just to give a randomexample we just received ~60
patches from a single 'newish' contributor all violating the above prescription.

We need extreme measures to keep the ML somewhat manageable.

I'm going to apply this one.

Thanks,

Paolo

