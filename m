Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573913;
	b=u/y1Zu+Rjzo6ja0kpDFSu8kdG39I0dea1rV1dctIb9Wv1E16xcJnAFB25x65We9TMI5N
	 WeWqV498EdI0KcdwV+9mQbPPPR+pD3q0nC/mmtQPsQNlZEJAgZsRXzZXsB9xktmxSJIY0
	 IJdxIxp1Y9Q2zaeokpNUQ0N+UURBURuwMoHkeaAHygf7ao8j4Kv1UtPX8JL28qhFx6jhC
	 r9Y9iIRY4w0Q9Z1djeESayfW5AN5AlU41z3FmjyoW4VNVHzs/qjGnHYRvkd0DkQmdHPyb
	 oWOcfGKPoOUQjtEGmSB/gI3XUIUiiHokl2almXw/yd8RxCf4tNCV13qCDaxjZ86JF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573913;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XMNffF9gfExpM/riFJmEIEYf1Y6eQwranys00FqUlgs=;
	b=DJWJvh6iApCM6cxtfd6fdi7+fPYqbmQ8P2Ks/9i2PCllTBS887lbwjBtKsWsPo+q2bX0
	 SXAMDOf2k9SaePoquj25KD+NRHsmstTO+XqMiSNVGwINHua++mFTXH6oqcVNPKH0bUBlE
	 tZQ9P7opV6sELaf/mg57ywMQ7sin+sFiCYI/Kd1jBBd6nI56bfSY7Spg2366gj50vpeVk
	 U1yZnpbcEKgz0Z8+5rLfZa+CpgC9ECJYCAGDwM4tUEbq+2KiVfDTeUW9QfcrvHD06QuVt
	 HBqcNusrIQzVJIEmkuFa7gW4oBAXkgwlRxTeI4IEEk2IgT8GduCG+wDF3WCZfxUjOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dGkil6+B;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA618606A31E;
	Wed, 25 Nov 2026 02:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA618606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dGkil6+B
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XMNffF9gfExpM/riFJmEIEYf1Y6eQwranys00FqUlgs=;
	b=dGkil6+BLq6/4BT9/ArxX1A3ieI6i2qk27rpbInV+DAeN3tZoglWZgUsp5pqnCqTR2le33TsC
	3fr0MaLOl2NO57PlvTcOrkdkDTLh8sG4GDDA7kFCaHPxiA1ONSHhKHA0QTyNxlwSA5RWQzH/1/9
	2aYozE+ZEFnRVMfpaqBY/Ow=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3ZT4NFRz12LkH;
	Wed, 25 Nov 2026 10:30:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EC74320333;
	Wed, 25 Nov 2026 10:31:45 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:31:44 +0800
Message-ID: <ae1f4fb2-7027-47d9-8981-6b3e2946f6ad@huawei.com>
Date: Wed, 25 Nov 2026 10:31:44 +0800
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
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <will@kernel.org>,
	<jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>,
	<steven.price@arm.com>, <chenhuacai@kernel.org>, <tzimmermann@suse.de>,
	<wenst@chromium.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
 <awXQtcWmqf7c_49B@shutemov.name>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <awXQtcWmqf7c_49B@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Kiryl,

在 2026/11/25 2:12, Kiryl Shutsemau (Meta) 写道:
> On Mon, Nov 23, 2026 at 11:32:22AM +0800, Jinjie Ruan wrote:
>> While the SDEI cross-CPU NMI is active it claims every cross-CPU
>> backtrace, so on a platform whose firmware exposes SDEI event 0
>> the irqchip NMI path can never be used.  There is no way to opt out.
>>
>> Add a boot parameter "sdei_nmi.disabled".
>>
>> With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
>> declines every request, so arch_trigger_cpumask_backtrace() falls
>> through to its IPI path and smp_send_stop() skips its SDEI rung.
> 
> Why keep event 0 registered and enabled when the switch is on?

These original codes are left for testing the IPI as NMI function.

> 
> If sdei_nmi_init() returns before sdei_event_register(),
> sdei_nmi_available stays false and both hooks already decline.

You are absolutely correct. sdei_nmi_available itself can block all SDEI
operations, which can simplify many things.

> 
> Then the flag is read only at init and can be __initdata. None of the
> other hunks are needed. The check in sdei_nmi_stop_cpus() is not
> reachable anyway: smp_send_stop() calls it only after sdei_nmi_active().

Yes, you are right! I will update them.

Best regards,
Jinjie

> 
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

