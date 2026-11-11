Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394412;
	b=bvzdPM5RWHjpCyXGB4a9qlChzBXh+dcxts1W85ChDxaHQJJM3vqFMu3aHzOUbF9O7UlT
	 33QdkCnhAjcdLvle7y99OBvfmkBJD4hpYj1UPg1nbj/Y9ni8P+k0jY1e1SojrcgZ375a6
	 7wpa/+eNguWCITeAuGrdNouY3q2a+REijdN5JWKOpKQWuSX7xvYCiCgePWdWPOxbM6H4j
	 7Vca7uIueAOQTcjN3ajtbCDVIdYLYSy0BDCC2zPjoXcb6xt7PyqBX8c7Yht3Lmlel+K4E
	 C/iWUanZ6AfBKGud31vbTsQfKzQmIOgxCqOFiTTIMDr870kRbEF4zADjzTyVBJE9ekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394412;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=8N7fypCJ/hoT+y3Nl5Cy8LcZBYe/io6SKN/QBhzDpOM=;
	b=B6Wjn0ExFDADqo6I5xMV4yfWZ7h6rj5uF/RQgpYTayNyEdqocBZb5ISqZzVgjiwzS+Sf
	 uZeETeC2LdI4xDXxSrVdtMJLAUSF+BwL4qatk2Fz+/ugmyOWonA1/wYLr2qcA/AmcHjbZ
	 L3dY15YVNcE504JP7TyxOlmS21E6SGQrVwbWn7TSbhV3q0tol48/IS49CMCoyUSdUjiCp
	 Bq2Cx8vpF5wmzvkkQWsI/YElHwrHTW4VsVkjMWge7PPvDVi5Zrs8erlJL+KFhnHvm6uO+
	 616UHBI9GGihTUp5cNKR2pJAYYxw+ir/ymE1uFkNfydfR8BowjD7VvQ/cWmYJobje3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Stw68hjz;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42F606A327
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B42F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Stw68hjz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794394410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8N7fypCJ/hoT+y3Nl5Cy8LcZBYe/io6SKN/QBhzDpOM=;
	b=Stw68hjzCo+rnGsgwOP+ghBBdlyy1gcjBMYY2EfphQ6FieprgldD72Q4/xLLiIQI80Jcih
	i9x7qzW69A8HNkomBgd6bqJAfSncnNAkYdZXe/0y1wY8BUeM8KjP+gB+B0CAeOT5r8N3Km
	wx9fXbwDrGZuue9/MMRugZeU7/SW11U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-711-DxKuXwMGPSCoAX2zKEuwcg-1; Wed,
 11 Nov 2026 05:53:25 -0500
X-MC-Unique: DxKuXwMGPSCoAX2zKEuwcg-1
X-Mimecast-MFC-AGG-ID: DxKuXwMGPSCoAX2zKEuwcg_1794394402
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9591F1955F61;
	Wed, 11 Nov 2026 10:53:21 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45ED518004FC;
	Wed, 11 Nov 2026 10:53:14 +0000 (UTC)
Message-ID: <38365dce-f6a6-4fdb-8f76-8b697f64aeb3@redhat.com>
Date: Wed, 11 Nov 2026 11:53:12 +0100
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
Subject: Re: [PATCH net-next 06/10] dpll: add KUnit tests for core locking
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
References: <20261106121005.1327603-7-ivecera@redhat.com>
 <179433320676.994134.7049432410059447687@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179433320676.994134.7049432410059447687@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/10/26 18:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In drivers/dpll/dpll_core_kunit.c, some tests set a blocking
>    flag before dt_req_start() has registered dt_req_release().
> 
> --
> 
> dpll: add KUnit tests for core locking
> 
> This adds KUnit tests for DPLL core locking. They use a mock driver with
> several domains to check domain sharing, which locks callbacks hold,
> independence and serialization of domains, atomicity of multi-attribute
> pin sets, and notification ordering. The netlink pre/post doit and set
> handlers are exported for KUnit so the tests can call them directly.
> 
>> diff --git a/drivers/dpll/dpll_core_kunit.c b/drivers/dpll/dpll_core_kunit.c
>> new file mode 100644
>> index 0000000000000..a58800eda5ff5
>> --- /dev/null
>> +++ b/drivers/dpll/dpll_core_kunit.c
>> @@ -0,0 +1,1471 @@
> 
> [ ... ]
> 
>> +static void dt_block(struct dt_dom *dom, bool *block)
>> +{
>> +	complete(&dom->entered);
>> +	wait_event(dom->ctx->wq, !READ_ONCE(*block));
>> +}
> 
> [ ... ]
> 
>> +static struct dt_req *dt_req_start(struct kunit *test, int (*fn)(void *arg),
>> +				   void *arg)
>> +{
>> +	struct task_struct *task;
>> +	struct dt_req *req;
>> +
>> +	req = kunit_kzalloc(test, sizeof(*req), GFP_KERNEL);
>> +	KUNIT_ASSERT_NOT_NULL(test, req);
>> +
>> +	req->ctx = test->priv;
>> +	req->fn = fn;
>> +	req->arg = arg;
>> +	init_completion(&req->done);
>> +
>> +	task = kthread_run(dt_req_thread, req, "dpll-test");
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, task);
>> +	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, dt_req_release,
>> +							req), 0);
>> +
>> +	return req;
>> +}
> 
> [ ... ]
> 
>> +/* Blocks a request of @dom in a callback, which holds the domain lock */
>> +static struct dt_req *dt_block_in(struct kunit *test, struct dt_dom *dom,
>> +				  int (*fn)(void *arg), void *arg)
>> +{
>> +	struct dt_req *req;
>> +
>> +	WRITE_ONCE(dom->block, true);
>> +	req = dt_req_start(test, fn, arg);
> 
> [Severity: Medium]
> Can the teardown hang here if dt_req_start() fails one of its assertions?

Yes. It takes an allocation or kthread_run() failure in the test, but
then the cleanup blocks under dpll_lock for good.

[...]
> One option is to register a cleanup action that calls dt_unblock() from
> dt_init(), before any flag can be set. Another is to set the flags only
> after dt_req_release() has been registered. Would either of these work?

The objects of the foreign and on-pin tests are added by the tests after
dt_init(), and KUnit runs the actions in reverse order, so an action
registered in dt_init() would run after their release. v2 clears the
flags in an exit callback of the suite instead. KUnit runs it before any
cleanup action, so it also covers dt_test_stuck_foreign_device().

Thanks,
Ivan
---
pw-bot: cr

