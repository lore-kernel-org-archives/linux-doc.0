Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D344126;
	Sun, 19 Nov 2023 19:32:55 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VwfuOLj_1700451172;
Received: from 30.97.48.234(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VwfuOLj_1700451172)
          by smtp.aliyun-inc.com;
          Mon, 20 Nov 2023 11:32:52 +0800
Message-ID: <06eb8c00-3ee8-7004-ce2c-cb84cf03e970@linux.alibaba.com>
Date: Mon, 20 Nov 2023 11:32:51 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: erofs: add EROFS webpage
To: Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org
References: <20231117085329.1624223-1-hsiangkao@linux.alibaba.com>
 <4e99d1a3-026f-b5f0-fd15-fba57692d973@kernel.org>
 <056d09c0-eb0d-2092-0766-bf253a9d8751@linux.alibaba.com>
 <43466ecc-7218-e813-7a4f-bcce30f9b3fb@kernel.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <43466ecc-7218-e813-7a4f-bcce30f9b3fb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/11/20 11:31, Chao Yu wrote:
> On 2023/11/20 11:23, Gao Xiang wrote:
>>
>>
>> On 2023/11/20 11:18, Chao Yu wrote:
>>> On 2023/11/17 16:53, Gao Xiang wrote:
>>>> Add a new `W:` field of the EROFS entry points to the documentation
>>>> site at <https://erofs.docs.kernel.org>.
>>>>
>>>> In addition, update the in-tree documentation and Kconfig too.
>>>>
>>>> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
>>>
>>> Nice work!
>>>
>>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Hi Chao,
>>
>> Thanks for the time and review! but I've already do a tag this morning
>> for Linus later so it may not contain this tag, sorry about that.
> 
> Xiang,
> 
> No problem, it seems I replied a little bit late. :-P

Yeah, since all commits in principle need to be in -next.  Thanks again!

Thanks,
Gao Xiang
