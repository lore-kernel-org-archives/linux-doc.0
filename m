Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B85127BF7D;
	Mon,  9 Mar 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773028291; cv=none; b=ge3e2Gy+a+VkExauLEv0mR9JPVFItLM/xSW5humvjJCiTaO79ifX6U0saHoDSRXsUe/mozcvN0V87s1OwzSo7OIqtvjw3BFAZextOguwJdaKdiwQxCKsXwAWDkMKk3Pa1uNh/eycoZ8zpgzSbzkTa5v01eabTyiTt2zpbTQE9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773028291; c=relaxed/simple;
	bh=kcL23/BdYll5Xu9h2gvxF/onFl2mGbt0GelRCWkQ+eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQUqqEbwrwiqb36Bp6I3K0QwsrKXIGS4/HvPvzrAuGdLqygoe8ve4/FnuKAlM/6ciAiLBu86w0xF++u3+q4B33psxR+25Ps9rkgL+IYAXxfQWhv49uswXV9qotxf7HyMVEUGpbwcLKOud/5e+eZVyNQj4heUQx529B0Da1lK2N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrADHeDmIQ65pf3KmAA--.45893S2;
	Mon, 09 Mar 2026 11:50:32 +0800 (CST)
Received: from [10.12.170.148] (unknown [10.12.170.148])
	by gateway (Coremail) with SMTP id _____wAHANd9Q65pcUAaAA--.6504S2;
	Mon, 09 Mar 2026 11:50:22 +0800 (CST)
Message-ID: <4bea49ae-cd00-4f5f-801b-60320293c41c@hust.edu.cn>
Date: Mon, 9 Mar 2026 11:50:21 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/checktransupdate.py: fix missing prefix in
 f-string
To: LIU Haoyang <tttturtleruss@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Yanteng Si <si.yanteng@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308104135.9037-1-tttturtleruss@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260308104135.9037-1-tttturtleruss@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrADHeDmIQ65pf3KmAA--.45893S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrur13uw1xtF1UCF1kur18Grg_yoWkArb_Zr
	97Aw4UtFykXFy3tFWktw1fuF1F9r1UXrn0qFs5tayxuF90qFs8XF90yrZ8Gw18JFZxXFy7
	uasxWwnFva9I9jkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 3/8/26 6:41 PM, LIU Haoyang wrote:
> Add a f prefix to f-string in checktransupdate.py.
>
> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>

Hi Haoyang,

could you help fix all the issues mentioned by pylint? There is another 
issue reported by pylint.


tools/docs/checktransupdate.py:79:4: C0103: Variable name "HASH" doesn't 
conform to snake_case naming style (invalid-name)

Dongliang Mu

> ---
>   tools/docs/checktransupdate.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
> index e894652369a5..bf735562aeeb 100755
> --- a/tools/docs/checktransupdate.py
> +++ b/tools/docs/checktransupdate.py
> @@ -131,7 +131,7 @@ def check_per_file(file_path):
>       opath = get_origin_path(file_path)
>   
>       if not os.path.isfile(opath):
> -        logging.error("Cannot find the origin path for {file_path}")
> +        logging.error(f"Cannot find the origin path for {file_path}")
>           return
>   
>       o_from_head = get_latest_commit_from(opath, "HEAD")

