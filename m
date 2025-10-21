Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7A32C329
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041795; cv=none; b=W5CbKE8sg6c1eb3M54DjDf+U+ZmnV4lP7gtmaxTXnlgW913PifRGsBNB+rhO9hw9bhWfSYdfw0QZJGV3Y2UlaXUdV/V96lJJdk0gMjuLxgvB2tCj8wJFYHDsBLphYEOwr6Lhy2wFmFw3uJxtNfSMwgRhfwQXeOOwuLzKw5FD+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041795; c=relaxed/simple;
	bh=k4u+Ihr8vkpW4CkylMViplglhKtMWRS32gog7rSU0tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMPIcUHq+V9OYUAMXxCRQ8/6cKEIX6kBh10uDYYFQga/CZUQMg30OSqOsvGPJRCmMB3EF23ZFQAfAmgbHvqAGVyrpZLdi9VkLEB08DDTzCrURetTMwdZTP1uS2OedlttV1JjTOUifnV4R0v6ssx1fd2Byrq4O4n5eRLsHcTN2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuOcBqVb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuOcBqVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761041792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAfOpf2VC9r1Aq/Ba8aQCcqsQ1cmp5ERa0FiKT74Dxg=;
	b=RuOcBqVbzlP8LuytTqqi4dm40pseJ2d08KKcvkoW6SV8Ec5FQhgP/O+S6DcDw9B1RrQnp4
	/6wYhvD3qbrJFUathbw3K/ZQSj/Zmk65YvUyWFUeauBpE0G+dMjLo0Cx7jAAWrLlsK6ORN
	AW1tcpM7MFDl1lGpqGIDWbvyBYZ58IU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-JErr6AsMMp-bgXpMkoDhHw-1; Tue, 21 Oct 2025 06:16:29 -0400
X-MC-Unique: JErr6AsMMp-bgXpMkoDhHw-1
X-Mimecast-MFC-AGG-ID: JErr6AsMMp-bgXpMkoDhHw_1761041788
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42558f501adso2203688f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 03:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041788; x=1761646588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAfOpf2VC9r1Aq/Ba8aQCcqsQ1cmp5ERa0FiKT74Dxg=;
        b=oGmuTUjPHg0lBl/GIeXbMWfjYqAouOsvHT97od4QzlSihMAqCPMn07toSwgMSM+Lyi
         Wwmnhk6HGZ6VF3QBynCwT2BfO3JsD4Je9BXHkUxu2ktgYHrKK0EGddHlleZf6Za0imuR
         Z7ZM+94gcKQys2+8oT+qCnrbhVWIzZZLCqxymXYQNM6xmO/fmmG7adeWGx3BYh2c/+yI
         tzz5azJjlcczz5vBV7Zzw/PB+hPzIBGH6Ehl0Al0Tonu6Z2XhrCC3eMJ7GNyAgP+jJvf
         3PtatzuFim0vzNneRqnQw3iQK0kV2Gh1TEO97j9Jq1XrfPV6Z7fBtXV5nFbA0W3L6/Hh
         VaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7znZWMnp5JZde4BJTezauog1qHiznX5famUHtkWykkLBfmj9ukbrspD8LEnXF060kRHSYUQW5YKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhaWABDy6tNIiyW/RPT++v/vii5b1GBnOPo8/nvH62Apt696BT
	oorBlzkaoX6M8PTjweuEcDIzA77N4bhFj6jiS61fLMYsRBOMghwBmIAoAnIpScB3RPgy9HylG8/
	MV/bLxpTXopIAjxoTMSi416TyPhNySC/YyY7RQnbkU+ArSk9gcO5IZ45ycEmh3A==
X-Gm-Gg: ASbGncvTAWR9iEmV85M5TAssxoDa2Mbb25gloz0vrGTzB8hTwc0J8MnGEdhN9azZOs6
	LP0m2TA8sbCBst4Yr536bsIoSgLtk2VeiojsrrSr6mjJdNQw4WkSnO2jqUfKVRaYCJi6l+W9XsA
	XTST1e5ng+bhb8iGZEuZfY3tG2f603vQYl03K46gjxfLTQKT+j3N2ew8tAu8e+vW40yNTcVjikM
	AI8AVYVZf3uhk3pLZfQ6WyAKdjiWl9ozs/A3rwUQHuzEhlwun/AI9qZsA0k+cNwrXnfKASTbcBt
	cyOUJBSNwkFDfu6u8NFrX6Y7Y5OyxOVRtflEFKv7a93zbzHxLrY8ieGKIB1LeScXzyifwZeXaJW
	fHVVyREVVzW3CdLT/XAQ5s807hsGowKn82ZEj1NgbGqYdvfs=
X-Received: by 2002:a05:6000:186a:b0:3ec:db13:89e with SMTP id ffacd0b85a97d-42704d1441cmr9403285f8f.7.1761041788474;
        Tue, 21 Oct 2025 03:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk4jyuQMg0K8Aws1Lv1y09/ZSf7i4qxnIBZGs2bQmXI8n6Npjep0Yjfazd/+t0xT4RT5Y7QQ==
X-Received: by 2002:a05:6000:186a:b0:3ec:db13:89e with SMTP id ffacd0b85a97d-42704d1441cmr9403254f8f.7.1761041788036;
        Tue, 21 Oct 2025 03:16:28 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4731c95efb9sm155390235e9.8.2025.10.21.03.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:16:27 -0700 (PDT)
Message-ID: <1e779b80-4645-420d-8cae-36c36c3575e3@redhat.com>
Date: Tue, 21 Oct 2025 12:16:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v02 4/6] hinic3: Add mac filter ops
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Markus.Elfring@web.de, pavan.chebbi@broadcom.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>
References: <cover.1760685059.git.zhuyikai1@h-partners.com>
 <dccaa516308f83aed2058175fdb4b752b6cbf4ae.1760685059.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <dccaa516308f83aed2058175fdb4b752b6cbf4ae.1760685059.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 10:30 AM, Fan Gong wrote:
> +static int hinic3_mac_filter_sync(struct net_device *netdev,
> +				  struct list_head *mac_filter_list, bool uc)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	struct list_head tmp_del_list, tmp_add_list;
> +	struct hinic3_mac_filter *fclone;
> +	struct hinic3_mac_filter *ftmp;
> +	struct hinic3_mac_filter *f;
> +	int err = 0, add_count;
> +
> +	INIT_LIST_HEAD(&tmp_del_list);
> +	INIT_LIST_HEAD(&tmp_add_list);
> +
> +	list_for_each_entry_safe(f, ftmp, mac_filter_list, list) {
> +		if (f->state != HINIC3_MAC_WAIT_HW_UNSYNC)
> +			continue;
> +
> +		f->state = HINIC3_MAC_HW_UNSYNCED;
> +		list_move_tail(&f->list, &tmp_del_list);
> +	}
> +
> +	list_for_each_entry_safe(f, ftmp, mac_filter_list, list) {
> +		if (f->state != HINIC3_MAC_WAIT_HW_SYNC)
> +			continue;
> +
> +		fclone = hinic3_mac_filter_entry_clone(f);
> +		if (!fclone) {
> +			err = -ENOMEM;
> +			break;
> +		}
> +
> +		f->state = HINIC3_MAC_HW_SYNCED;
> +		list_add_tail(&fclone->list, &tmp_add_list);
> +	}
> +
> +	if (err) {
> +		hinic3_undo_del_filter_entries(mac_filter_list, &tmp_del_list);
> +		hinic3_undo_add_filter_entries(mac_filter_list, &tmp_add_list);
> +		netdev_err(netdev, "Failed to clone mac_filter_entry\n");
> +
> +		hinic3_cleanup_filter_list(&tmp_del_list);
> +		hinic3_cleanup_filter_list(&tmp_add_list);
> +		goto err_out;
> +	}
> +
> +	add_count = hinic3_mac_filter_sync_hw(netdev, &tmp_del_list,
> +					      &tmp_add_list);
> +	if (!list_empty(&tmp_add_list)) {
> +		/* there were errors, delete all mac in hw */
> +		hinic3_undo_add_filter_entries(mac_filter_list, &tmp_add_list);
> +		/* VF does not support promiscuous mode, don't delete any other uc mac */
> +		if (!HINIC3_IS_VF(nic_dev->hwdev) || !uc) {
> +			list_for_each_entry_safe(f, ftmp, mac_filter_list,
> +						 list) {
> +				if (f->state != HINIC3_MAC_HW_SYNCED)
> +					continue;
> +
> +				fclone = hinic3_mac_filter_entry_clone(f);
> +				if (!fclone)
> +					break;
> +
> +				f->state = HINIC3_MAC_WAIT_HW_SYNC;
> +				list_add_tail(&fclone->list, &tmp_del_list);
> +			}
> +		}
> +
> +		hinic3_cleanup_filter_list(&tmp_add_list);
> +		hinic3_mac_filter_sync_hw(netdev, &tmp_del_list, &tmp_add_list);
> +
> +		/* need to enter promiscuous/allmulti mode */
> +		err = -ENOMEM;
> +		goto err_out;
> +	}

I'm under the impression that this code could be simpler if
hinic3_mac_filter_sync_hw() don't modifiy the argment lists, but set
some flag on the successfully added entries.

In case of failure, you traverse the tmp_add_list and delete all the
unflagged entries.

Both lists are always cleaned-up at function exit.

/P

