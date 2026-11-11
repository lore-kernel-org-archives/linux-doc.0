Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394525;
	b=E7HsKXPZlQ1cSA83BbfSG3t716a87R2PrEEYpc/IooY9RimtE2kVCQNc/femiR0YLSa2
	 qeFeENIWOGMrCeFc/jElyGpNtKGEYvdEzvoEkaQFS+TlqFNY26jC7D2vvUp0FUneLIMa0
	 P+K1OgjHYMYJDUgODR/lvRZ4Pkqq+YaaKhxJx7S9a/F5V59cKiYC45KKhjbiHSpz7vKPp
	 Z05uRh74OVI7Nc+kKtpba6CZDFqqt96aa2NURBf36fy7etcqih8AppsvHxGJdFD6weDi5
	 ItU2JNtCAI3Uoj0yHas/hWRjKTyE58kaxlWgtmmlCgHj2pApIXRzh8e89LtEvUV5KEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394525;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=SF2NQhuQxu5m0bI5v5rpx1rhcNXkOJ4L4wUCi27ileQ=;
	b=w6DyCbf2ERwxITbKzDM4oOyqa8v85M9HS8FgV6pdeODn+Rk2fOFTxAMdlZdEY7qCXSyc
	 EdEVj4gZ1ydhlzZPg9ZrWlV/Wq8HctZkZbdQfD5PFyEnsJBdKsy0wZJrxhQu7uWY2Ty9L
	 uoeUKbTlIWIyfBHJRefwC4cCLxLAItaUw23FNWnZuZEhcRh9jrLUxDvS2wjS0kDbD2XDD
	 297msoEugMA5MBhs258NBV/VJIc31xCJJxRl5OK7P+eJh3R1nk2xPYaR/VRxn1pw83gGp
	 kpNtqWHjHA9rm0G6k8cSAt+2Gx1tDDvVWMnMi7LUJeWpl3UpJwMBARcrRc4D7x7cjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c4OMQT2M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07876606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07876606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c4OMQT2M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794394523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SF2NQhuQxu5m0bI5v5rpx1rhcNXkOJ4L4wUCi27ileQ=;
	b=c4OMQT2MwJ4oKX0j71IjKSG27bbGJcsEW0j4MBRVVCdJzfCTTwqE/sX2BM4IR0YUtN7u40
	Fpqy6Ba1STSciQbkRbTKB9fHLV+WRfKCR7uH3mb5VUJ6nyKD7l33dOM68GHmNKgyFqF+0v
	Ph5hTOPrfMWa1xTDkHn4Fqg0/PhF4AU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-Oqo0X7NTPyKcaINytLDz9g-1; Wed,
 11 Nov 2026 05:55:20 -0500
X-MC-Unique: Oqo0X7NTPyKcaINytLDz9g-1
X-Mimecast-MFC-AGG-ID: Oqo0X7NTPyKcaINytLDz9g_1794394517
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EAC619775DB;
	Wed, 11 Nov 2026 10:55:17 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 523A518004FF;
	Wed, 11 Nov 2026 10:55:10 +0000 (UTC)
Message-ID: <fe93c3de-e478-4bdf-877a-d3c5d345dd04@redhat.com>
Date: Wed, 11 Nov 2026 11:55:09 +0100
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
Subject: Re: [PATCH net-next 01/10] ice: dpll: notify TSPLL lock status from
 the periodic work only
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, min.li@microchip.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, grzegorz.nitka@intel.com,
 karol.kolacinski@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
 poros@redhat.com
References: <20261106121005.1327603-2-ivecera@redhat.com>
 <179433319925.994134.5092477928749468374@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179433319925.994134.5092477928749468374@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/10/26 18:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] This patch leaves the comments in
>    ice_dpll_tspll_state_on_dpll_set()…
> 
> --
> 
> ice: dpll: notify TSPLL lock status from the periodic work only
> 
> This patch stops ice_dpll_tspll_state_on_dpll_set() from sending a TSPLL
> device change notification from the TIME_REF pin callback. The callback
> now only updates dpll_state. ice_dpll_periodic_work_e825() refreshes
> dpll_state on every run and sends the notification when the state differs
> from prev_dpll_state.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
>> index ade1fb3dd0674..bdbcf7af296eb 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_dpll.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
> 
> [ ... ]
> 
>> @@ -2947,15 +2946,12 @@ ice_dpll_tspll_state_on_dpll_set(const struct dpll_pin *pin, void *pin_priv,
>>   		WRITE_ONCE(pf->ptp.tspll_locked,
>>   			   new_state == DPLL_LOCK_STATUS_LOCKED);
>>   
>> -		if (tp->prev_dpll_state != new_state) {
>> -			tp->dpll_state = new_state;
>> -			tp->prev_dpll_state = new_state;
>> -			changed = true;
>> -		}
>> +		/* ice_dpll_periodic_work_e825() compares the state with
>> +		 * prev_dpll_state and sends the notification.
>> +		 */
>> +		tp->dpll_state = new_state;
> 
> [Severity: Low]
> This isn't a bug, but do the comments in ice_dpll_tspll_state_on_dpll_set()
> still match how the notification path works after this change?

[...]

> Could both comments say that the periodic work picks up the new state
> through pf->ptp.tspll_locked? Then a later change is less likely to drop
> the WRITE_ONCE() as just a way to avoid spurious notifications.
Right, the first comment still gives the reason from before this patch.
Now the write of pf->ptp.tspll_locked is what brings the new state to
ice_dpll_periodic_work_e825(). v2 will merge both comments into one that
says so.

Thanks,
Ivan

