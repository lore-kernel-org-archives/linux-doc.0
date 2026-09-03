Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34914E56FD
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451010; cv=none; b=h8kMBzXdn2ttLTWlh7uMBgWz4ZzjRsMnUEdOh3Waq+FXzlxqj50enB5FalfDQ4ZZ05OW4PqMadrj4bcotl/ovMpywleDlInccI4z5+2oRou/k9P2Bkl/4KTljA/WJkc89GiFRKphhN1CJyoEIyToaBoRGX63hC4iFhGdFATJo8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451010; c=relaxed/simple;
	bh=lxBqtxuBOusWek29/dJLnhOh3CXKdVZPRI0FxP1c5Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HsIy2UwCC+uWw4uH7InUdtdUN1MBD6om+qlIjtjkmxuAisMcheG/PbMgPwzCEiWWUur2L8GEJiB4JgmX1HomTwyiNF9BGe+xCpzSrS0ONT2pXKJ5KE9D/hR8qpXAZblMvaJyuWCzkDVd1cGlkfdQ0Brtv84ZFOFd0oM/9CIY+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQo+kq4U; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQo+kq4U"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ecf499af9so364467b3.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451007; x=1789055807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BU0pHPVrhHdYT1WkFVjJDxv8ZrMHIUMFXolTYoauB9k=;
        b=lQo+kq4UWwDlpZeOEEP99HIxKTkbXa22CzVxTvgRhMqVdwJPmvEadu7Z1PPsc7n+Ot
         tNi0hBKLyX89tm5Akujrxu7rvzRQsJTxh8Af/S6X9GtrIO/vECznZSa0UGmWS6pQK22E
         aKSJybGMnsEIEkpZvHffrfKpCEh0KmseKypapHPdiHpiVzIHuKSiLQZ6puLJuf5s2pRd
         dUqzZCdCY4oDDZISS7orriblx7dpn7V2T2xZZQXV4mAcWWtdseR7qCR/bKytEqTDVsy4
         y1+A8lhabJguPQmA6GIdKz79GhFuY5EXnpNhoRotiHWovAufo8107CCwfLxCGpblYekS
         vpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451007; x=1789055807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BU0pHPVrhHdYT1WkFVjJDxv8ZrMHIUMFXolTYoauB9k=;
        b=Q4h5eXAVQ8D8WOHEb0XEQU8p7322bAMHgiAJvLFBlDaUwjjp9MFJhMrOoByQ8Iu9Qs
         jqS7Q9G+CY7iCJl8Jgtz4LzCdfvj8I7/p37J5q2Dth17n3yV11sLLm5atNFZBSRyxcGZ
         hPWspGjQ65/5FMGAA/lh3xfAMUG30r/PLiitzjpQDJfyAGfUbPgwgx7Mx0SgkRPI5nHk
         FU+5SIjNpswl15FmXRTQL8YuTdgQmFfp8TdLxLXE/0nkKLIgXRBR9IJEkEsk5NlsV7VE
         M7SqnV54oa1KTOfxIPLYTM5PPDFPoUdbYhTkE8IqNCIirScFtnkTh6wR9rxJa8OGxi5h
         CXHw==
X-Forwarded-Encrypted: i=1; AKwUvBxYhmeP0dmCwBKr50U6mfB/WmYuVR5c7Z4ArQ+rhA7432TDvUq7dEmVXH6W4+VOD5vYg1iwYj2Nk9o=@vger.kernel.org
X-Gm-Message-State: AFuF++n8lsWKNlAtJfJA7zkP4FICVNTvVjs4CfJXrRWRVTKPkyNWVBr9
	PJielNW6pYQjr/WKdHWbXXC8O5zfLldu7HwZz0Z0RUcZ3bu4YJJXQ6FoexB2zJ7zxUo=
X-Gm-Gg: AYBFou19awFBclzCOkIWLiwtxcbwRw92Tu54mg3PjKjSnbQceyCAjqQHNh3uAucDew7
	Stb272fAtj1exfp57Wk2ScCbDt9b5lojHnQRKyK7daI9b9UTnf+OgRiX/eXZ8OD2lX3q0JArLNK
	FogSUVlQDqpCpJbSKmyJPzs3CTwFgNwuP3ACwpWuQS6Qc7d9gunrVy+JgprwEqPVquj2TaVFqIx
	1n3UoF90Pz1dgDSqdNBXCcU5oXDk57KwMZnkprJ8BGY3CpuLDFMGBUnr/u7CMjIREGyZTMgARZn
	gVsdlaLZB4OMnJ1LdMO4FNxvkWxhRxB97Ge/6FQ5wc/1sOjgGuyC+9np2RU6RpJ0y/HSDRExkLb
	rfgTPLbRzuZeN9NvE34H/s8LOdWHUtgCbkZNZ6SUCajMMc7lUwaAnz1ZVggvtgJSUT9dfXfg30M
	ZW0m597JuPZdj6dC6eiAodE8xq6auEMVpKEuk+dK9zxkG7kxt/IkOgzF1inAuRT45n0oyh2hWMF
	CU=
X-Received: by 2002:a05:690c:5609:b0:81e:7d90:5673 with SMTP id 00721157ae682-86c53678a4amr59135427b3.26.1788451007441;
        Thu, 03 Sep 2026 08:56:47 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c1784192bsm42962537b3.30.2026.09.03.08.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:56:46 -0700 (PDT)
Message-ID: <1fd96ec4-4247-4d6d-8936-cf4607a206c1@gmail.com>
Date: Thu, 3 Sep 2026 11:56:45 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next 1/8] e1000e: add jumbo Rx CRC stripping
To: Simon Horman <horms@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 aleksander.lobakin@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830232146.36948-2-tactii@gmail.com>
 <20260903102730.578872-1-horms@kernel.org>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260903102730.578872-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:27, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/20260830232146.36948-2-tactii@gmail.com?part=1
> ---
> e1000e: add jumbo Rx CRC stripping
>      
> When the hardware is configured to not strip the FCS (CrcStripping=0),
> the jumbo Rx path would deliver frames with the FCS still attached.
> Follow the standard path's convention by stripping the FCS at EOP and
> leaving it out of the byte count.
> 
>> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
>> index 844f31ab37ad4..599600ad695cd 100644
>> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
>> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
>> @@ -1631,13 +1631,23 @@ static bool e1000_clean_jumbo_rx_irq(struct e1000_ring *rx_ring, int *work_done,
>>   			}
>>   		}
>>   
>> +		/* strip the Ethernet CRC; it may span fragments */
>> +		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
>> +		    !(netdev->features & NETIF_F_RXFCS))
>> +			pskb_trim(skb, skb->len - 4);
>> +
>>   		/* Receive Checksum Offload */
>>   		e1000_rx_checksum(adapter, staterr, skb);
>>   
>>   		e1000_rx_hash(netdev, rx_desc->wb.lower.hi_dword.rss, skb);
>>   
>> -		/* probably a little skewed due to removing CRC */
>>   		total_rx_bytes += skb->len;
>> +		/* If configured to store CRC, keep the FCS bytes out of the
>> +		 * total_rx_bytes counter
>> +		 */
>> +		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
>> +		    (netdev->features & NETIF_F_RXFCS))
>> +			total_rx_bytes -= 4;
> 
> [Severity: Medium]
> Could these lockless evaluations of adapter->flags2 and netdev->features get
> out of sync if userspace changes features via ethtool while a packet is being
> processed?

Yes, this could be prevented by bringing down the adapter before changing bits
in e1000_set_features().

> 
> If a concurrent change occurs between the first check and this second check,
> it appears it could lead to an inconsistent state where a packet's payload is
> incorrectly truncated by 4 bytes, or where the byte statistics are overcounted
> or undercounted by 4 bytes.
> 
>>   		total_rx_packets++;
>>   
>>   		/* eth type trans needs skb->data to point to something */

