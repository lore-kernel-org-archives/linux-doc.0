Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777485;
	b=2U/QrQ2yDpocSuA3bUrCur5m8kUrQwAA/TT6om/mtmIpHe7zC5tqR8NcNgY7WlEcEDin
	 E/1G730Scmx0SGzit9oKIHLU7e5bp1iVg+sPDj/SrcWnVBZEgAxBuRrEtqzEE16j3ZwIR
	 de0/Czogs360JN6+dArgzrvGMs4NUOQsGCPLfHpnzSUfprst8PZbk5L1Rz2gNu6/OYMtb
	 UgY6hi4CH0rcPrDvOubaAxnaHQ4tdVOzB4Xfkmqbi16Wvyemd4dCCHmvlezbrMN68cIYI
	 suCx/eMrR5WKje+mLR3RoSO0bC3GqSD6kzDxw0TcoWYqkkKNTI7WgO9Jw/vxTG0K0og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777485;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=VMrUYXQUrjRv8D6jnVOeKgcB2hClnYhG7iAf43ZxPzy9xiAm09lwbh1bKdT6A23vTZ2S
	 Q8dVLqE2W/+ODYpp8SUP0mMIRuat6l7PTncVCozEmdWRVBOB00vxIlT67tx0WPaWyaWVj
	 k49UL66ZRHVYQYAtzFFOLCc+g7KKZCoNW93F27+BbEriL2MZ0SwdwSO6NKWASmwz+KYZB
	 9FNMYIjKYZjLVEHVp8LDQB/YtEVFE3SVfX3VzLqy1AGkblLiSJOqnClD4v5w3LtRNg+PL
	 abzcMT4usEkoeL0voCmHylIVf6IDHlZswljbu/5QNPgOAtEbyNrpx0LBpAfCAPIfhzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtFThmXU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB749606A333
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 07:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB749606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RtFThmXU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qPyUMYEP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793777483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
	b=RtFThmXUaobUIH25Guv6Bv4O1n98Dbs/s+kBKa2BMbgEHcEYH6siwtptKu0SEnseoSqo25
	DEaRK5luGGY2/cwPB9ri8gWdyMkc4Ld9g3ZU98W3FFyn7Ca+eEvHhFvMx/FbZG/81xq8iG
	TTOnNYsZVJTx3vpQdQTLzbdKhgISMk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-MIf_tFXjMsarFpKDwcwDVw-1; Wed, 04 Nov 2026 02:31:20 -0500
X-MC-Unique: MIf_tFXjMsarFpKDwcwDVw-1
X-Mimecast-MFC-AGG-ID: MIf_tFXjMsarFpKDwcwDVw_1793777479
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so2983425e9.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793777479; x=1794382279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=qPyUMYEPu6QMDw+ynFBXj+Jukdd/b7kY/MwSzggCPBbpqxVgSSKgaPVvCXHszLHMco
         DlChHW+HSdOND+z92arp08ItIKAl5SBxI6sb508qvBIMVvrx5D+CCApcPJ6w2U8LroJm
         r4b2JM0Z5YGcJCNO5bJoyhZPF2SGZUAU5HamlEA3FNIx58qghw1wsKgWyPu6gXbmqnQN
         E+gOashfTRRTa6fbRRxM9NEUCG+fzcXqMLRRTDR5xfCivw/vR7Iab+z/LJZmmRbcob58
         7nPyMK1EcwD+cvreIfJGyM9HJYnIuzgjJgn3rUsVj/grOtz2KJY44lsvT26XeYlcUWSR
         WrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777479; x=1794382279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf1SJ60wh6rt1cgDzJ1XsuN+6DsStx0G3H1EPBnHUrc=;
        b=YVrjmfXuFV0lLD/0aBvE1DLFAn4mWo720ADSnJbE9m8fZWeJRveoM4oHbVREprVIAb
         CZbfIuPLItSSZwe7Vwf6CkroFsv77KACz6L6GxxN+kC4sMVLx9kC/QG87uBvBqF8da8i
         DMjnX4hkqdfkLRbDno0/AP4gQhGhfzVaFNwPLjL8D0/gb0Zb9nPcEQLYy+AArEIxFqcj
         /w44kHNvtWsLqK0jrDaEjbz93ok2dV3XXdLKaX1rgSEkrftJbNslQYae1BFT01/em4ay
         n8q9vejwphrkpNoVbflukT4MALzOEKB7SCTnoV0MHOFDYd5T4LA9YXNeklwX1kWGVSUw
         ezPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtSUpDO+TXm8hhUPDa/KsDvr/zFFT8JijeaX7+CJ6f0x7aY4dss8FCP6+tNVvWeMHO3vpCXMF1dM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NbXkH86qPGrgIuwbdqoLSURxQrtvTx9nCdjkkzOygAbCBoPXw
	V2z47BOysCKGGxo5icZsOdCi2Q5mC5SadzSiWV6exHYsXygEKoxOSJEEunyYL+K7npgGU1FN+9d
	8MLkVYP6M27c2MyBmoHcizP9qQ7BRALZcfjnDCcXndTkvEkkKtWn36nThbFi2AA==
X-Gm-Gg: AYBFou0yNmOnJZe8/pSeXXQJjPR+NWRh5pDcMl+bvj7IFlbaH7YKtHVa/mDJGxCK/sg
	AO+2hARYiVfusQhAvz0KXDbW3Tr8jqQaKYPJps1GDKMGyhRj0CSm6sEew66jS5txAJ+9F4M3aEB
	sT5E1vPz248Dk6JZCxYEDm4ZAsEP+lDKR13VTAgfs03gjvSLq+al0ePW2tv6yjhiPWG+koU4+UO
	3zbX64lp06imMfTlwUSUHLx+dQqWfbZ0KjDnzSrT4Zqr4dNBdYGryJgfpZ/vhpOSncDF/NyHcYZ
	naGAmMX20dUWAm4R+PtruHZ+aFrRQQonBlSgOOa+MaZQBg6jk7C/VD9FiEY4BGn6fGkLV8cQSId
	sqWW5+XIgM/x3gYhTlJ7Knk19SHiDoFzIrpyR5cc9B7LKr4SyGzvun2Wn9Hlj+0fH1fVzEBdM0Q
	N+vrNt7llp+tYAuJWk54XtATLJ8rxSUwMUT2UzeLpkc+0=
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342501375e9.13.1793777479242;
        Tue, 03 Nov 2026 23:31:19 -0800 (PST)
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr342500785e9.13.1793777478812;
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4532916f2sm29117235e9.5.2026.11.03.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:31:18 -0800 (PST)
Message-ID: <a323799f-a817-4022-96dd-e6f376fb4d03@redhat.com>
Date: Wed, 4 Nov 2026 08:31:17 +0100
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
Subject: Re: [PATCH net-next 1/2] netlink: add an optional per-netns ROUTE
 multicast index
To: patrick <work_patrick@qq.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, corbet@lwn.net, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104033526.2917590-1-work_patrick@qq.com>
 <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <tencent_1E208C03035DF063166FD46C1DA1978F6306@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 04:35, patrick wrote:
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> index fe43e8595..0cda347ed 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -280,6 +280,33 @@ checksums.
>   These messages are now emitted at KERN_DEBUG and can generally be enabled
>   and controlled by the dynamic_debug facility.
>   
> +netlink_route_mc_index
> +---------------------

The above breaks kdoc

/P

