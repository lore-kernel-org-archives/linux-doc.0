Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F23306776;
	Sun, 12 Jul 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845355; cv=none; b=pGczZTOFq99pED2z/IkQJ5ERnj0JfIdVAZEbQMpKabBeTF+YqCYcO4ARdrKhSNOT44mmnKHTMF+grOrIBQV1nqK2r0fhW25N6xCoqBAkfsN4onY163uI6AjnaZBVBEmv3pzGs+eLMnmUn+mI0GHwAKhUYwKBYS6PA1WvTBDXoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845355; c=relaxed/simple;
	bh=OizSyL5Q7tCDR2wboLxU49WvrlbcwzmARSuDqniPHYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwV1QIWcjtj1FTXd2GUrjy9j2BcmEdi0YvBb9nTd5u3w1knHcbu561RYm9b80kM9p2CJ29DQU2JSYiUMWvcXRYyc9WFU4EXXTva5JurhyXJXRnB2zAHpMS7ULBN7BsW5JRaAJUCyy+EOiblfRD8Rpr38/lZr4fXPPCurlZ/5XzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrADHzyvLUVNqco3lAQ--.51686S2;
	Sun, 12 Jul 2026 16:35:23 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHgNfJUVNq0oq+AA--.35361S2;
	Sun, 12 Jul 2026 16:35:22 +0800 (CST)
Message-ID: <8f01e453-6a4b-4f35-b533-55d89c1a9ae4@hust.edu.cn>
Date: Sun, 12 Jul 2026 16:35:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
 <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
 <alMp5-UPJks0xEvS@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alMp5-UPJks0xEvS@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrADHzyvLUVNqco3lAQ--.51686S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UGrW8uF1ruw4DCw17Wrg_yoWrGFyDpF
	yfJwn7t3y8JF12yrZ7GwsYkr1YyrWDuFW5J3sxWr4jyrsxuF9Yqr4Fkw4akFy7Ar45C3sx
	ZFWq9F97W3Z8Ca7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07bxmRUUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/12/26 1:45 PM, Weijie Yuan wrote:
> On Sun, Jul 12, 2026 at 12:47:16PM +0800, Dongliang Mu wrote:
>> Hi Weijie,
>> Could you please try cloning
>> https://mirror.nju.edu.cn/git/kernel-doc-zh.git/ <https://link.wtturl.cn/?target=https%3A%2F%2Fmirror.nju.edu.cn%2Fgit%2Fkernel-doc-zh.git%2F&scene=im&aid=582478&lang=zh>
>> and verify whether this mirror is stable?
> OK, I just did a quick test on my debian 13 (local physical server):
>
> $ git clone https://mirror.nju.edu.cn/git/kernel-doc-zh.git/
> Cloning into 'kernel-doc-zh'...
> remote: Enumerating objects: 11675982, done.
> remote: Counting objects: 100% (11675982/11675982), done.
> remote: Compressing objects: 100% (2008049/2008049), done.
> error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> error: 7397 bytes of body are still expected
> fetch-pack: unexpected disconnect while reading sideband packet
> fatal: early EOF
> fatal: fetch-pack: invalid index-pack output
>
> then again:
>
> GIT_TRACE=1 \
> GIT_TRACE_CURL=1 \
> GIT_CURL_VERBOSE=1 \
> git clone https://mirror.nju.edu.cn/git/kernel-doc-zh.git/
>
> [...many verbose outputs]
> remote: Enumerating objects: 11675982, done.
> remote: Counting objects: 100% (11675982/11675982), done.
> remote: Compressing objects: 100% (2008049/2008049), done.
> 13:24:10.505880 http.c:994              == Info: HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> 13:24:10.505973 http.c:994              == Info: Connection #0 to host mirror.nju.edu.cn left intact
> error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> error: 6191 bytes of body are still expected
> fetch-pack: unexpected disconnect while reading sideband packet
> fatal: early EOF
> fatal: fetch-pack: invalid index-pack output


It seems like the same issue with our mirror site. I've forward this 
email thread to NJU mirror maintainers.


>  From the output, it seems that there was an error in the mirror of NJU's
> nginx, the Git HTTP backend behind nginx, or the upstream connection
> between them, but I'm not 100% sure.
>
> I will conduct several more tests immediately to troubleshoot the
> problem, to see where exactly the problem lies.
>
> In addition, cloning with a cloud server in Hong Kong:
>
> Cloning into 'kernel-doc-zh'...
> remote: Enumerating objects: 11675982, done.
> remote: Counting objects: 100% (11675982/11675982), done.
> remote: Compressing objects: 100% (2008049/2008049), done.
> error: RPC failed; curl 92 HTTP/2 stream 5 was not closed cleanly: INTERNAL_ERROR (err 2)
> error: 3965 bytes of body are still expected
> fetch-pack: unexpected disconnect while reading sideband packet
> fatal: early EOF
> fatal: fetch-pack: invalid index-pack output


I tried the NJU mirror in my laptop, and successfully clone the 
repository from NJU mirror. There must exist some unknown reason to lead 
to this failure.


>
>> TUNA has limited storage capacity and has asked the NJU mirror site to host
>> this Git repository.
> Fully understand, easy to notice that TUNA is under big preesure these days.
> Thanks, NJU!
>
>> We are currently diagnosing network issues on our mirror site. The classic
>> architecture - Nginx (serving static frontend, HTTPS, and caching) -> Apache
>> (reverse proxy + CGI execution) -> cgit / git-http-backend - appears to be
>> functional in principle.
>> The clone failures with large Git repositories are likely caused by
>> insufficient or inappropriate parameter configurations rather than the
>> architecture itself.
> Agreed, it is very likely that the transmission problem is caused by the
> large size of the warehouse.
>
>> P.S., I am the mentor of HUST OpenAtom Club, and our club is maintaining the
>> hust mirror site.
> Thanks very much.

