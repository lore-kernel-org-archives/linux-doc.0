Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=31.70.137.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198049;
	b=O4aiNJ6So7gXjwEK9uFtX6U3BBRwAT3Cvq/RaS3pyE4asSFl2U33xu2F6fp3smA3992x
	 xe1BTVkcSJAAQqsHCSgkbEh1TwUeuZ76VfBou36THclIeu5mlwn8QZ8jTkLOOnrXAcr5n
	 X+mjONILcnuoHpGBwWMIiXpAzIRBDR9wpXcGrbQ6Bdg6+H+U+BEzRH2L3fkpPXYTT8xUP
	 nMxUbuZPzOVIVjLvhnnBRbOdl0psNfFAJXUAluA2kP20DEWpm481DXKwC3xJUqUdjE99g
	 Pzyn1dHoPWews2QxnU9uPG0PJ/Z9y2j5fkHRO5ClJRjjusUEi+n2g1hwXuE7dVx5APQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198049;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spam-Score:
	 X-Clacks-Overhead;
	bh=vLvWjKh1LRnRhnuwrtjU/KRMUpKZP14gigi9j87P640=;
	b=tkttvnofAWp/XMV+GBdwTa75WqyB0jpe1QS/G4NcOPaH4k6VhS7cw9rEfxUIxHsL+8Ag
	 sIQV8JlGunWWDB2MfFLG6/r0EE8+uacGB/nESeGbqgEQ7a75JIUNaFYABUTBaTztHHBAO
	 5UiyW3LABgYMQO9HbiieKOk0H89/G83oabctanpKD5Q+ZdWmREMFJmYsmoFdh/b9DrPRz
	 LfA16JZsVhdTl3HIZNXBjKedFh0iTU1FoGtM0fzQQMqUaZIiLroAR3Qn28/RiTLEdwI8b
	 6HaKYppXqUVPZpIS7mJIYcOt+da94yYZXoK/5njGswtS7ppbFAJuEAo7iub2BU9au+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cambridgegreys.com;
	spf=pass smtp.mailfrom=cambridgegreys.com;
	arc=none smtp.remote-ip=31.70.137.218
Received: from ns3.kot-begemot.co.uk (ns3.kot-begemot.co.uk [31.70.137.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B7F606A893;
	Fri, 20 Nov 2026 18:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B7F606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cambridgegreys.com
Received: from [192.168.19.6] (helo=jain.kot-begemot.co.uk)
	by ns3.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xUT0z-00000002Jix-1yiC;
	Fri, 20 Nov 2026 18:07:13 +0000
Received: from [192.168.21.17]
	by jain.kot-begemot.co.uk with esmtp (Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xUSmt-0000000ERT6-3f1a;
	Fri, 20 Nov 2026 18:07:12 +0000
Message-ID: <4a3531de-35a7-4b2d-a9fc-11a77a8d057f@cambridgegreys.com>
Date: Fri, 20 Nov 2026 18:07:10 +0000
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
Subject: Re: [PATCH v2] docs: UML: user_mode_linux_howto_v2: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
In-Reply-To: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett



On 20/11/2026 17:55, Manuel Ebner wrote:
> Add missing ')'.
> 
> CC: Renzo Davoli <renzo@cs.unibo.it>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
>   Correct position of closing bracket (Randy Dunlap)
> 
> [v1]
>   https://lore.kernel.org/all/20260909140051.1365758-2-manuelebnerli@mailbox.org/
> ---
>   Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index 9224bea5ee..e4b1cb1092 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -581,7 +581,7 @@ https://github.com/virtualsquare/sshlirp
>   
>   connect to a local area cloud (all the UML nodes using the same
>   multicast address running on hosts in the same multicast domain (LAN)
> -will be automagically connected together to a virtual LAN.
> +will be automagically connected together to a virtual LAN.)
>   
>   ***********
>   Running UML

Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
