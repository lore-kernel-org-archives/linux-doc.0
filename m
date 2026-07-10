Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B922E420E7A;
	Fri, 10 Jul 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688779; cv=none; b=BrFUqR+o4iBA1pkQdiyOqo4AUliDo2nnOs+poYzcj6bZf2zdNDk+QtAwirWfw/yqPD8K1YCwEdv4ELUPDF+oKmoB1Jn66FmOOffoqfQ6w8qRce7yFukFiGMUThLnluZZ51Px41YaaoipqvTp2Mt6aVj2d0QYmN+gJtjzBCDECWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688779; c=relaxed/simple;
	bh=oVPvk9SWrOuVxXOHwmUYLgrUdutompR9PdZBPk5tcQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHAkLPV+40thhX5dYgsbLcxkuCVuuSqF4R3NkZj4zdjzb1qL3+ftS/XfsKWNa1/2xCVozpje/5vAJJY0Jr+SXvr7cTIwq5J8nYAEtodBZTcPrWRb2InBhA5duY6dkVygs45bfM81KSQLCH0Gk/YrfMLVxcIOMzFj4Of3B30uMJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrABnb7Mv7lBq1M9hAA--.3679S2;
	Fri, 10 Jul 2026 21:05:51 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wAXks4s7lBqgzpyAA--.40697S2;
	Fri, 10 Jul 2026 21:05:49 +0800 (CST)
Message-ID: <06fcda8b-b507-409e-9ded-299baa6ddd09@hust.edu.cn>
Date: Fri, 10 Jul 2026 21:05:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Hu Haowen <2023002089@link.tyut.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABnb7Mv7lBq1M9hAA--.3679S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4xuF47Kr45XFykJF1UZFb_yoWxtFW7pF
	yIga4fKF4IyF9Ykry2krW8Ar4xt3W8Cr4xGF1kXFn5Kw1xuFWIyr4fKry7XFZ7Xry0yayr
	Zr15GFW8A3W3CFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUVoGHUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/10/26 4:49 PM, 葉宸佑 wrote:
> Gentle ping.
>
> This v2 addressed the review comments from Alex and Dongliang.
> Is there anything else I should improve, or is it queued somewhere
> I might have missed?

It seems like Alex is not on the cc list. None can pick up this patch.

Add Alex into this thread.

Dongliang Mu

>
> Thanks,
> Chen-Yu
>
> Chen-Yu Yeh <chenyou910331@gmail.com> 於 2026年6月3日週三 下午4:26寫道：
>> Translate PRC tech terms into Taiwanese tech terms (e.g.,
>> 內核 -> 核心, 代碼 -> 程式碼, 軟件 -> 軟體) to improve
>> readability for local developers. Also, rephrase several
>> awkward sentences to make the document more fluent.
>>
>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>> ---
>> Changes in v2:
>> - Update Signed-off-by to use full real name.
>> - Add Reviewed-by tag from Dongliang Mu.
>>
>>   .../zh_TW/process/8.Conclusion.rst            | 45 +++++++++----------
>>   1 file changed, 22 insertions(+), 23 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
>> index d1634421b62c..823969cf793d 100644
>> --- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
>> +++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
>> @@ -14,42 +14,41 @@
>>
>>   .. _tw_development_conclusion:
>>
>> -更多信息
>> +更多資訊
>>   ========
>>
>> -關於Linux內核開發和相關主題的信息來源很多。首先是在內核源代碼分發中找到的
>> -文檔目錄。頂級
>> +關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
>> +文件目錄。頂級
>>   :ref:`Documentation/translations/zh_CN/process/howto.rst <tw_process_howto>`
>>   文件是一個重要的起點；
>>   :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
>> -也是所有內核開發人員都應該閱讀的內容。許多內部內核API都是使用kerneldoc機制
>> -記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文檔
>> -（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文檔）。
>> -
>> -不同的網站在各個細節層次上討論內核開發。本文作者想謙虛地建議用 https://lwn.net/
>> -作爲來源；有關許多特定內核主題的信息可以通過以下網址的 LWN 內核索引找到：
>> +也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
>> +記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文件
>> +（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
>>
>> +不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
>> +作爲來源；有關許多特定核心主題的資訊可以通過以下網址的 LWN 核心索引找到:
>>     http://lwn.net/kernel/index/
>>
>> -除此之外，內核開發人員的一個寶貴資源是：
>> +除此之外，核心開發人員的一個寶貴資源是：
>>
>>     https://kernelnewbies.org/
>>
>> -當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
>> +當然，也不應該忘記 https://kernel.org/ ，這是核心發佈資訊的最終位置。
>>
>> -關於內核開發有很多書：
>> +關於核心開發有很多書：
>>
>>     《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
>>     線上版本在 http://lwn.net/kernel/ldd3/
>>
>> -  《Linux內核設計與實現》（Robert Love）
>> +  《Linux核心設計與實現》（Robert Love）
>>
>> -  《深入理解Linux內核》(Daniel Bovet和Marco Cesati）
>> +  《深入理解Linux核心》(Daniel Bovet和Marco Cesati）
>>
>>   然而，所有這些書都有一個共同的缺點：它們上架時就往往有些過時，而且已經上架
>> -一段時間了。不過，在那裏還是可以找到相當多的好信息。
>> +一段時間了。不過，在那裏還是可以找到相當多的好資訊。
>>
>> -有關git的文檔，請訪問：
>> +有關git的文件，請訪問：
>>
>>     https://www.kernel.org/pub/software/scm/git/docs/
>>
>> @@ -58,16 +57,16 @@
>>   結論
>>   ====
>>
>> -祝賀所有通過這篇冗長的文檔的人。希望它能夠幫助您理解Linux內核是如何開發的，
>> +祝賀所有通過這篇冗長的文件的人。希望它能夠幫助您理解Linux核心是如何開發的，
>>   以及您如何參與這個過程。
>>
>> -最後，重要的是參與。任何開源軟件項目都不會超過其貢獻者投入其中的總和。Linux
>> -內核的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
>> -變得更好。內核是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
>> +最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
>> +核心的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
>> +變得更好。核心是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
>>   工作時，可以做出什麼。
>>
>> -不過，內核總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
>> -重要的是，Linux生態系統中的大多數其他參與者可以通過爲內核做出貢獻而受益。使
>> -代碼進入主線是提高代碼質量、降低維護和分發成本、提高對內核開發方向的影響程度
>> +不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
>> +重要的是，Linux生態系統中的大多數其他參與者可以通過爲核心做出貢獻而受益。使
>> +程式碼進入主線是提高程式碼品質、降低維護和分發成本、提高對核心開發方向的影響程度
>>   等的關鍵。這是一種共贏的局面。啓動你的編輯器，來加入我們吧；你會非常受歡迎的。
>>
>> --
>> 2.43.0
>>

