Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1402E213254;
	Wed,  5 Aug 2026 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935539; cv=none; b=CyNNkV/mFGrM3beSUp2/4zNiJkUvguMMya/It2SKD5jFBlAxoY8ANwJp9IUYJbMh/HqyVjeOJvuqZ5yV+kof/I+BDMC9orBnbHHckLJ+qrP4iqNlrPO3QXmQwLsbvKZqLetvA7LadCXFmuIBZoEB06HKw2n/ufocSkXZ6lrNhEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935539; c=relaxed/simple;
	bh=w9If46KXNyKyLHPVBi4PdKHhMgz66K0trTvlZFFNB+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GqC4XWjUfZTt1bn/CDijASr2s21gti9cwlh3KHTgE5VujwiY4Od8DKhFstYDJxfbJ/qF+ngPJ+zY3v+QPlctWAwrRPpZtrHkqf9TAmIj5h8yi5w9IC82tVdmkrzlOVd0idd6PBY8h85U1MfPXPy1jewFE9Py1YHfFQPULsOp26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrADn7yufNnNqIN__Ag--.57062S2;
	Wed, 05 Aug 2026 21:11:59 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDn71ebNnNqGPIaAA--.37874S2;
	Wed, 05 Aug 2026 21:11:58 +0800 (CST)
Message-ID: <328d031a-14ae-4cc3-a200-462094f0e2e1@hust.edu.cn>
Date: Wed, 5 Aug 2026 21:11:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ksm: update comments and docs to reference folio->mapping
To: Hongfu Li <hongfu.li@linux.dev>, akpm@linux-foundation.org,
 david@kernel.org, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, alexs@kernel.org, si.yanteng@linux.dev
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
References: <20260805105927.41987-1-hongfu.li@linux.dev>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260805105927.41987-1-hongfu.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrADn7yufNnNqIN__Ag--.57062S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWw18KryDJryDXr47ArWxtFb_yoWrWr4kpF
	W8K34Iqan3Zr1Fg3y8GF4jyF1UZwn7Ga1jkFn8K3WfZFn8A340qr4Ig3W3tFy8ArZ2kayY
	qFs0kF909a4jyr7anT9S1TB71UUUUbDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jw
	0_GFylnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b-GQgUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/5/26 6:59 PM, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
>
> The KSM code already stores and checks the stable node key via
> folio->mapping, but the comment in ksm_get_folio() and the reverse
> mapping documentation in ksm.rst still refer to page->mapping.
>
> This is a pure wording update to match the folio-based implementation.
> No functional change is intended.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>   Documentation/mm/ksm.rst                    | 4 ++--
>   Documentation/translations/zh_CN/mm/ksm.rst | 4 ++--
>   mm/ksm.c                                    | 7 +++----
>   3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
> index 2806e3e4a10e..2b4f72f1f953 100644
> --- a/Documentation/mm/ksm.rst
> +++ b/Documentation/mm/ksm.rst
> @@ -24,13 +24,13 @@ tree.
>   
>   If a KSM page is shared between less than ``max_page_sharing`` VMAs,
>   the node of the stable tree that represents such KSM page points to a
> -list of struct ksm_rmap_item and the ``page->mapping`` of the
> +list of struct ksm_rmap_item and the ``folio->mapping`` of the
>   KSM page points to the stable tree node.
>   
>   When the sharing passes this threshold, KSM adds a second dimension to
>   the stable tree. The tree node becomes a "chain" that links one or
>   more "dups". Each "dup" keeps reverse mapping information for a KSM
> -page with ``page->mapping`` pointing to that "dup".
> +page with ``folio->mapping`` pointing to that "dup".
>   
>   Every "chain" and all "dups" linked into a "chain" enforce the
>   invariant that they represent the same write protected memory content,
> diff --git a/Documentation/translations/zh_CN/mm/ksm.rst b/Documentation/translations/zh_CN/mm/ksm.rst
> index f0f458753d0c..822c7a289671 100644
> --- a/Documentation/translations/zh_CN/mm/ksm.rst
> +++ b/Documentation/translations/zh_CN/mm/ksm.rst
> @@ -31,10 +31,10 @@ KSM维护着稳定树中的KSM页的逆映射信息。
>   
>   当KSM页面的共享数小于 ``max_page_sharing`` 的虚拟内存区域(VMAs)时，则代表了
>   KSM页的稳定树其中的节点指向了一个ksm_rmap_item结构体类型的列表。同时，这个KSM页
> -的 ``page->mapping`` 指向了该稳定树节点。
> +的 ``folio->mapping`` 指向了该稳定树节点。
>   
>   如果共享数超过了阈值，KSM将给稳定树添加第二个维度。稳定树就变成链接一个或多
> -个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``page->mapping``
> +个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``folio->mapping``
>   指向该"副本"。

The Chinese translation looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

>   
>   每个链以及链接到该链中的所有"副本"强制不变的是，它们代表了相同的写保护内存
> diff --git a/mm/ksm.c b/mm/ksm.c
> index ab1fc59424e8..4bde9fd8d44e 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -959,10 +959,9 @@ enum ksm_get_folio_flags {
>    * seconds or even minutes: much too unresponsive.  So instead we use a
>    * "keyhole reference": access to the ksm page from the stable node peeps
>    * out through its keyhole to see if that page still holds the right key,
> - * pointing back to this stable node.  This relies on freeing a PageAnon
> - * page to reset its page->mapping to NULL, and relies on no other use of
> - * a page to put something that might look like our key in page->mapping.
> - * is on its way to being freed; but it is an anomaly to bear in mind.
> + * pointing back to this stable node.  This relies on freeing an anon
> + * folio to reset its mapping to NULL, and relies on no other use of a
> + * folio to put something that might look like our key in its mapping.
>    */
>   static struct folio *ksm_get_folio(struct ksm_stable_node *stable_node,
>   				 enum ksm_get_folio_flags flags)

