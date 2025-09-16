Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7027275B1F
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012519; cv=none; b=Ql6Mwd2hLIfSBtBRwnQ9984fgq9qgdshDMjesL7ZXYKJjwH5lSsJTKQ6elue3Zy/vf17jBR9svwToQ8lINXKpmNgWkQk7Iy9xVjJJn1rbeomNZW/Hh7JCyp/ETLTN9b+cXQyiGiCbtp1iLjQcnXQBKr2fGGYfcrn7y8i0F3mJYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012519; c=relaxed/simple;
	bh=OTx1CX18N3834rVvwPY9O7+tKZ/kymmSB63p4JEscVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxXGvAEAv8ipopGhWXAgLrYEl/xVrd+/ZzvMriJxR5F3zQoUOyImCAgDKjY0ePN3Gp/PGd5ieg79seEXT7BE24LnX+eoTtUcVEWQG0rsBbUaqinMI1bXU6N4raiDKbJzxU6v1Vag9GKVXWxfohSDI6CLyUq0xZnPGgcBVw8BuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWSVhcmW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWSVhcmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758012516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmN1zVAHoxMBQ4g/7XFyoJDJue0wyL96gZwCleosapQ=;
	b=fWSVhcmWJLGlXlLSSPuKY01paG+CEGOLTrTGsx/o8xhrTHqd+yhEwrVOZzxXTYcFFaMETh
	1mEtiRrgLSLnv0EYHbskOpDEFpxJ5/rTMJQkDn67SexMc2I0GaRqF2aBRdlJbMi654UT9c
	hEfDx+5WpvCbl12FGA2aobcqLLzSd/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-z6kk_I_NNZW7G_jNGQQtHQ-1; Tue, 16 Sep 2025 04:48:35 -0400
X-MC-Unique: z6kk_I_NNZW7G_jNGQQtHQ-1
X-Mimecast-MFC-AGG-ID: z6kk_I_NNZW7G_jNGQQtHQ_1758012514
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45f29c99f99so15999235e9.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 01:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758012514; x=1758617314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmN1zVAHoxMBQ4g/7XFyoJDJue0wyL96gZwCleosapQ=;
        b=fsH+zCnPskuF7x5HvTQiV+NXubkXW8e0IFAyZ1eP2f6OP2ZHxxPxG4xUk2JGHgix97
         rNc0BRly9W5+r7ixABuSycyQvvVyrXk8MxDyzubZOtOX8+PBcBnjLLy7YTkjCtTMCAEY
         MgMhCsbgS5nW4SqeEOhR/2uPgzt7t9vjJULZFt4n8PLzfYIURjAn7jOk1sqnNNQ6Q8hs
         tR4/c54s8ihCE8M+sbdmak52CMcyCjgMO5r/isqDM9yAG47qe3UMjd/Y2bCHsQ6Lrc9N
         oax4wgZFVnwJ81GUTNzi+jhxlHKGbnOKwtVAyM9K6YnAhC5jE3afKHkY2lvLx25jmsYM
         ajiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP+1cDy1lKzupBYYNOCD582p26W6yZO2z70MXRNNgZw0A29lV2bEAFL+GFIrM3CBz0bM7frmkudTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFT2Vuz/JHO7L1K+zxqdob+eN2uTSrA0fvOsfWdU6XrM7YhvWh
	zvoF5q7msAX0QOUE1FEexudz9CvAt3p34rM1XuvqEdUaPQTZ5SSCYnHBut4UdIhdMMmj3jnovKq
	ruq+3v0lyblEipnopRT7fCds5lj5MZXNPlt7hUBFQ9Nc3uifOhwG3ifPZpibRsw==
X-Gm-Gg: ASbGncsGq5cyRc4UngtEbc1r5oP/fKHpxyrc2y47JEfW3jATj93M9KYHB9EN+fEwApO
	1VnafbfoD8qk+hcMJGqCfrd/zfmk7XgLtYxf4klAO2yhtSGZFrcmBRA2vye1GKY5GxAU4/u8mU1
	qFq/EFRzam6VEuqXHIyV7DeRMxytjSQOMsQXFyMD2VaJ+2w3CpHjDiArjXeUBzy8LFU4Pw8aqNS
	8CBn6JmSuS9hPyXpQg7eafefIsZ4LEONiwydecGo8tTNfPRMRzcYuRVTwe7geisxJAR0SVSeOrB
	UE9IXAaGBDxGuFFBANuReyfsTDhx5CS1XIRXyQ04Xp3ndJBBXyjf7gGRnw7ajDEMJmRmHCe2hTd
	BNr7F2vVgZY+D
X-Received: by 2002:a05:600c:8a0c:20b0:45d:d944:e763 with SMTP id 5b1f17b1804b1-45f2120600amr120929435e9.33.1758012514011;
        Tue, 16 Sep 2025 01:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMOKpkiTHjhH8V1CoxbkwPtQS09nDDz3Z1SOX4Anr7W9Jju1W3xt7/QkqndQiKwCF6Tcwikw==
X-Received: by 2002:a05:600c:8a0c:20b0:45d:d944:e763 with SMTP id 5b1f17b1804b1-45f2120600amr120929185e9.33.1758012513639;
        Tue, 16 Sep 2025 01:48:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157619fsm215833385e9.7.2025.09.16.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 01:48:33 -0700 (PDT)
Message-ID: <a52f9dfc-cfb8-40ec-b5e5-102b99803b1f@redhat.com>
Date: Tue, 16 Sep 2025 10:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v06 00/14] net: hinic3: Add a driver for Huawei
 3rd gen NIC - sw and hw initialization
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <helgaas@kernel.org>,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>,
 Lee Trager <lee@trager.us>, Michael Ellerman <mpe@ellerman.id.au>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Suman Ghosh
 <sumang@marvell.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Joe Damato <jdamato@fastly.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1757653621.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cover.1757653621.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/25 8:28 AM, Fan Gong wrote:
> This is [3/3] part of hinic3 Ethernet driver initial submission.
> With this patch hinic3 becomes a functional Ethernet driver.
> 
> The driver parts contained in this patch:
> Memory allocation and initialization of the driver structures.
> Management interfaces initialization.
> HW capabilities probing, initialization and setup using management
> interfaces.
> Net device open/stop implementation and data queues initialization.
> Register VID:DID in PCI id_table.
> Fix netif_queue_set_napi usage.

Side note: You lost/did not add a few Reviewed-by tags from Simon. For
future memory it's usually safe/better to retain such tags in presence
of minor editing.

Thanks,

Paolo

