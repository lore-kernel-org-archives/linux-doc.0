Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2561632E7
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317739; cv=none; b=ClnvA9xiy8HjRDiiGpAfcTDu+6z92NSMow9pNxq7/bNZoi6dO98KoGlxhkdAb8hO8ldFBjKTmItkoKYgKDlwv7BEM828Mt5tnSVe82l61O9jXPgz/3BjilEUxvQEYXYCy+NC3aDX44+u+4EHWTz7/6U96TYqk/Z0dAuXVPHz/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317739; c=relaxed/simple;
	bh=VGUC6wUOypIV4CsAk/cYVlAk1OOCaoat8J+NcnwZaqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8G0xAJRUsi8W1Vl/69+rc9R+0AekUgJUh/wQfiFziEAmitaoV16uGsppO38HnGxM8ESpX58HZr0Q7h1WJClbAqrNP9058Eab9W5hiE8B9Owvkl8vN0+dW63tT2GfvwpNf+VK9WyTzN7iq+mLN2osTK5rQsOfI2JhEArAuQ9+wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODJTs8II; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXJ47++w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODJTs8II";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXJ47++w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773317734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=loNIpigFiuTuj5urzh0sT/xjUHse+AOsRM2zfPikL40=;
	b=ODJTs8IIKinuIZPSkxiPDWNy60g4f79MmwqgDIPkjiTG3axr5DFR/q4/fiu7qKyckHDbvQ
	0pZvxhIGlqHctNZaSXeZfiwe6UYZjfuS3w5LNebmOhxtXqK9b8TeBeJ6Fq27yAsfwAc1R9
	XZv4QDHLgdLp2B4Qh3joGpP3sbAdpnk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-5DhS6Q5JN12dPaovOHodxw-1; Thu, 12 Mar 2026 08:15:33 -0400
X-MC-Unique: 5DhS6Q5JN12dPaovOHodxw-1
X-Mimecast-MFC-AGG-ID: 5DhS6Q5JN12dPaovOHodxw_1773317732
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48532df52c5so8402595e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773317732; x=1773922532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loNIpigFiuTuj5urzh0sT/xjUHse+AOsRM2zfPikL40=;
        b=bXJ47++w5qRWlgCajG20ztHev//ND09tPL04sIVb44XJLHHvnIQFm7lDHhCK/Wemx+
         ppq2tDhkJSlKhrfDuBiyJSJ02meVB2jw7tc5C298cRtKTQbu7+lYHK2EmGlLV3a6oMEQ
         TkgoJ691iT5/8PdUhD0ApHfCrd39GTJHOAn3f4uPHtfj5/tuOXkq+0hhDt5R+ccF2LEX
         dmuWuYQmzmzf1XSxdzvuBAJDKQxY9EyWMsNeNRwYA3qJWQzaYfH8FAbVn1IWdMHjgQfU
         zHJH4LCBRjf2emRlNlB60XfQGmwqUzSGbyOV7K/n3BwIyiUhtTB0fPoNmUJ6IT8m+eyl
         IPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773317732; x=1773922532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loNIpigFiuTuj5urzh0sT/xjUHse+AOsRM2zfPikL40=;
        b=oioURNIVGvN9vtiDtth/p9dW1fYyF7iFMCEsHNqKlNZuO+Xu0kw+ysuu/vflx/M8vu
         HCmTcko7cG3k+cPke+JuYzDQwZ8ZQ2Pdu4bTNvEjgW1HMsvIfeUP9t7/Bo+yM0JCPFJD
         pcNXDzFUy10wjECYALHkAvbvpKonAkwoWvoQgBNSwWfyirCmh6ZO8MyvsKiYaCZW9iVf
         hQ4zjwKiouyIhuom99qHu+FYMkf3E6fWDR1Sajt7Jqv0xg5aRVFVqKkQCFysFAFRSctG
         0rJmipakv3uv8Adp5Uuov6DS2oPip3dxZJPugjIgswxuEWOMeMdU8RxMA4BjcZ+i27AH
         5+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX8MBn0aj2f381pw7zxKX/k4kxwHQcJeaMaxbNyhiAUUA3Rbz1WibhZ4YzaFHqW8K9bx1Q2rZAFUHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47m9CjrYfwHT7MGJmDUbfXCyR1t1yNczRX0fdwcT6HaA+gydC
	Uf2fATqfsnEqZUpAW17MVeximRv/DlSpouIJboDYtp06VTjvg0qrmnj5DgUL5XB0FoAMQBgix53
	TfbpdDKXZMGNMRhlVPyW0bsrBKpscfv6d5nFQMsUBKjjVhadbD3uCXlAcRZXRsQ==
X-Gm-Gg: ATEYQzyB/9OBcU/EMTy6796S3K+x7e37ZBEpRlJiAPC3QBY3zGAm4liEEL3RORu/e2/
	8f2il3luUH7D+Oqzq8kXNKdZWv+YPF89K4NdzRzKi5lqpDBSaNHaTf0g+PWJlFqjhNJ5+X4O3eZ
	8WrN4D1eBMAKVcs6KeV991X9RwFiZzpnVfNDX+Ograj1vXNPstqN0F2zcrByhGgG33qBM2bkwz7
	avnK9tFyQTrdbe/fbwy8JqCw3fwBicvZHM67YzkEilg0rfW7EfEUhs0ksIHVFlmeh+fFBEWB5nV
	2aC25jp8oyUPJGE+9H14a4xQ7lpKVyaM5/K+aNgU/tqtp30WdQ8tUXQhQQWT6As1N+aR6d3UvOu
	KZDwSaW0cGgfqeEQvG3Mm+X9ORS6QeK12/pDnHKSqd0QuzZWlzcJ5Ij4=
X-Received: by 2002:a05:6000:2dc5:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-439f81c0248mr11988496f8f.14.1773317732155;
        Thu, 12 Mar 2026 05:15:32 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc5:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-439f81c0248mr11988421f8f.14.1773317731647;
        Thu, 12 Mar 2026 05:15:31 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm7076461f8f.10.2026.03.12.05.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 05:15:31 -0700 (PDT)
Message-ID: <606d9633-d48e-49ff-81c8-cbed7e92f698@redhat.com>
Date: Thu, 12 Mar 2026 13:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 11/11] net/nebula-matrix: add common dev
 start/stop operation
To: "illusion.wang" <illusion.wang@nebula-matrix.com>,
 dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, corbet@lwn.net, kuba@kernel.org,
 linux-doc@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, edumazet@google.com,
 open list <linux-kernel@vger.kernel.org>
References: <20260310120959.22015-1-illusion.wang@nebula-matrix.com>
 <20260310120959.22015-12-illusion.wang@nebula-matrix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260310120959.22015-12-illusion.wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 1:09 PM, illusion.wang wrote:
> +static int nbl_dev_configure_msix_map(struct nbl_dev_mgt *dev_mgt)
> +{
> +	struct nbl_dispatch_ops *disp_ops = dev_mgt->disp_ops_tbl->ops;
> +	struct nbl_dev_common *dev_common = dev_mgt->common_dev;
> +	struct nbl_msix_info *msix_info = &dev_common->msix_info;
> +	bool mask_en = msix_info->serv_info[NBL_MSIX_NET_TYPE].hw_self_mask_en;
> +	u16 msix_net_num = msix_info->serv_info[NBL_MSIX_NET_TYPE].num;
> +	u16 msix_not_net_num = 0;
> +	int err, i;
> +
> +	for (i = NBL_MSIX_NET_TYPE; i < NBL_MSIX_TYPE_MAX; i++)
> +		msix_info->serv_info[i].base_vector_id =
> +			msix_info->serv_info[i - 1].base_vector_id +
> +			msix_info->serv_info[i - 1].num;
> +
> +	for (i = NBL_MSIX_MAILBOX_TYPE; i < NBL_MSIX_TYPE_MAX; i++) {
> +		if (i == NBL_MSIX_NET_TYPE)
> +			continue;
> +
> +		msix_not_net_num += msix_info->serv_info[i].num;
> +	}

AI review says:

Is the condition `if (i == NBL_MSIX_NET_TYPE) continue;` correct here?
Looking at the enum in nbl_dev.h:

enum nbl_msix_type {
	NBL_MSIX_VIRTIO_TYPE = 0,
	NBL_MSIX_NET_TYPE = 1,
	NBL_MSIX_MAILBOX_TYPE = 2,
	NBL_MSIX_TYPE_MAX = 3,
};

The loop starts at NBL_MSIX_MAILBOX_TYPE (value 2) and continues to
NBL_MSIX_TYPE_MAX (value 3). Since the variable i never equals 1
(NBL_MSIX_NET_TYPE), this branch can never execute.

Should this dead code be removed, or should the loop start at a
different value if the intent was to skip NBL_MSIX_NET_TYPE?

