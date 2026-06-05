Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51883B14A9;
	Fri,  5 Jun 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664620; cv=none; b=TqnD6UfsudBzKEaZzwSCHfzbaw6kHYXRYQLBVDY4DZsg/54vKeDWcRxUOVpxkBFMkKR+S0PK573UAXpHNkY78bh9iD113IQ/raCofIu8DagnonlHIrqRaO8bXeYco+u+h+BEj3b1tG7lBSE7NdxtafSWV7zcJaxyDjQJu/OCac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664620; c=relaxed/simple;
	bh=+PjL0/ipWHlbJBdykkyAB281FLHG6omM9/xGOGrvTlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyjOMRARxzylw3EzJsePVjAlcUBSPMQuFeqkXuhjJcgtgzC9VqFWBdZpwWEAsArJ9UO8DoecNgdOmIQZhxguvEgy7DolTC0zRs6fRIavWF1hyq55Xbe6ReFszpgaaN40Gk3GgaB44BCmQ3EaQTIH/BuN8T1lrdqRszc4jtPX3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAnCQ7yyCJqB8QSAA--.48085S2;
	Fri, 05 Jun 2026 21:02:42 +0800 (CST)
Received: from [10.12.169.70] (unknown [10.12.169.70])
	by gateway (Coremail) with SMTP id _____wDHJQTvyCJqhI+dAQ--.12976S2;
	Fri, 05 Jun 2026 21:02:40 +0800 (CST)
Message-ID: <7b6913d0-921f-4f46-8d97-adf18eddb5d1@hust.edu.cn>
Date: Fri, 5 Jun 2026 21:02:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZG9jcy96aF9UVzogcmVwbGFjZSDmjqXlj6Mgd2l0?=
 =?UTF-8?B?aCDku4vpnaIgaW4gc3RhYmxlLWFwaS1ub25zZW5zZS5yc3Q=?=
To: panzhipop <kipp455187@gmail.com>, Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260603193408.140445-1-kipp455187@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260603193408.140445-1-kipp455187@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnCQ7yyCJqB8QSAA--.48085S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3Kw1rGw13Ar1kXr1xCr1kGrg_yoW8JFy7uo
	W3uFZFka48Gw43Xa4Yqa15CayxGr47AFWxCr4kG34j9r1UuFyYka1jq34UuFs09r13Xa13
	Ga9IkrW2yF1FyFsrn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOg7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/4/26 3:34 AM, panzhipop wrote:
> In Taiwan's standard terminology, as defined by the National Academy
> for Educational Research (NAER) term bank (https://terms.naer.edu.tw/),
> the correct Traditional Chinese translation for "interface" is "介面",
> not "接口" (which is used in Simplified Chinese/Mainland China).
>
> Update the zh_TW translation of stable-api-nonsense.rst to use
> the proper Taiwanese terminology.
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Signed-off-by: panzhipop <kipp455187@gmail.com>
> ---
>   .../zh_TW/process/stable-api-nonsense.rst     | 62 +++++++++----------
>   1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> index 4b8597fed5ae..a21daf29da10 100644
> --- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> +++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> @@ -14,21 +14,21 @@
>           中文版校譯者： 李陽  Li Yang <leoyang.li@nxp.com>
>                         胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
>   
> -Linux 內核驅動接口
> +Linux 內核驅動介面
>   ==================
>   
> -寫作本文檔的目的，是爲了解釋爲什麼Linux既沒有二進制內核接口，也沒有穩定
> -的內核接口。這裏所說的內核接口，是指內核裏的接口，而不是內核和用戶空間
> -的接口。內核到用戶空間的接口，是提供給應用程序使用的系統調用，系統調用
> +寫作本文檔的目的，是爲了解釋爲什麼Linux既沒有二進制內核介面，也沒有穩定
> +的內核介面。這裏所說的內核介面，是指內核裏的介面，而不是內核和用戶空間
> +的介面。內核到用戶空間的介面，是提供給應用程序使用的系統調用，系統調用
>   在歷史上幾乎沒有過變化，將來也不會有變化。我有一些老應用程序是在0.9版本
>   或者更早版本的內核上編譯的，在使用2.6版本內核的Linux發佈上依然用得很好
> -。用戶和應用程序作者可以將這個接口看成是穩定的。
> +。用戶和應用程序作者可以將這個介面看成是穩定的。
>   
>   
>   執行綱要
>   --------
>   
> -你也許以爲自己想要穩定的內核接口，但是你不清楚你要的實際上不是它。你需
> +你也許以爲自己想要穩定的內核介面，但是你不清楚你要的實際上不是它。你需
>   要的其實是穩定的驅動程序，而你只有將驅動程序放到公版內核的源代碼樹裏，
>   纔有可能達到這個目的。而且這樣做還有很多其它好處，正是因爲這些好處使得
>   Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選擇Linux的原因。
> @@ -37,8 +37,8 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>   入門
>   -----
>   
> -只有那些寫驅動程序的“怪人”纔會擔心內核接口的改變，對廣大用戶來說，既
> -看不到內核接口，也不需要去關心它。
> +只有那些寫驅動程序的“怪人”纔會擔心內核介面的改變，對廣大用戶來說，既
> +看不到內核介面，也不需要去關心它。
>   
>   首先，我不打算討論關於任何非GPL許可的內核驅動的法律問題，這些非GPL許可
>   的驅動程序包括不公開源代碼，隱藏源代碼，二進制或者是用源代碼包裝，或者
> @@ -46,14 +46,14 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>   詢律師，我只是一個程序員，所以我只打算探討技術問題（不是小看法律問題，
>   法律問題很實際，並且需要一直關注）。
>   
> -既然只談技術問題，我們就有了下面兩個主題：二進制內核接口和穩定的內核源
> -代碼接口。這兩個問題是互相關聯的，讓我們先解決掉二進制接口的問題。
> +既然只談技術問題，我們就有了下面兩個主題：二進制內核介面和穩定的內核源
> +代碼介面。這兩個問題是互相關聯的，讓我們先解決掉二進制介面的問題。
>   
>   
> -二進制內核接口
> +二進制內核介面
>   --------------
> -假如我們有一個穩定的內核源代碼接口，那麼自然而然的，我們就擁有了穩定的
> -二進制接口，是這樣的嗎？錯。讓我們看看關於Linux內核的幾點事實：
> +假如我們有一個穩定的內核源代碼介面，那麼自然而然的，我們就擁有了穩定的
> +二進制介面，是這樣的嗎？錯。讓我們看看關於Linux內核的幾點事實：
>   
>       - 取決於所用的C編譯器的版本，不同的內核數據結構裏的結構體的對齊方
>         式會有差別，代碼中不同函數的表現形式也不一樣（函數是不是被inline
> @@ -84,18 +84,18 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>   深刻的教訓...
>   
>   
> -穩定的內核源代碼接口
> +穩定的內核源代碼介面
>   --------------------
>   
>   如果有人不將他的內核驅動程序，放入公版內核的源代碼樹，而又想讓驅動程序
>   一直保持在最新的內核中可用，那麼這個話題將會變得沒完沒了。
> -內核開發是持續而且快節奏的，從來都不會慢下來。內核開發人員在當前接口中
> +內核開發是持續而且快節奏的，從來都不會慢下來。內核開發人員在當前介面中
>   找到bug，或者找到更好的實現方式。一旦發現這些，他們就很快會去修改當前的
> -接口。修改接口意味着，函數名可能會改變，結構體可能被擴充或者刪減，函數
> -的參數也可能發生改變。一旦接口被修改，內核中使用這些接口的地方需要同時
> +介面。修改介面意味着，函數名可能會改變，結構體可能被擴充或者刪減，函數
> +的參數也可能發生改變。一旦介面被修改，內核中使用這些介面的地方需要同時
>   修正，這樣才能保證所有的東西繼續工作。
>   
> -舉一個例子，內核的USB驅動程序接口在USB子系統的整個生命週期中，至少經歷
> +舉一個例子，內核的USB驅動程序介面在USB子系統的整個生命週期中，至少經歷
>   了三次重寫。這些重寫解決以下問題：
>   
>       - 把數據流從同步模式改成非同步模式，這個改動減少了一些驅動程序的
> @@ -105,22 +105,22 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>         需要提供更多的參數給USB核心，以修正了很多已經被記錄在案的死鎖。
>   
>   這和一些封閉源代碼的操作系統形成鮮明的對比，在那些操作系統上，不得不額
> -外的維護舊的USB接口。這導致了一個可能性，新的開發者依然會不小心使用舊的
> -接口，以不恰當的方式編寫代碼，進而影響到操作系統的穩定性。
> +外的維護舊的USB介面。這導致了一個可能性，新的開發者依然會不小心使用舊的
> +介面，以不恰當的方式編寫代碼，進而影響到操作系統的穩定性。
>   在上面的例子中，所有的開發者都同意這些重要的改動，在這樣的情況下修改代
> -價很低。如果Linux保持一個穩定的內核源代碼接口，那麼就得創建一個新的接口
> -；舊的，有問題的接口必須一直維護，給Linux USB開發者帶來額外的工作。既然
> +價很低。如果Linux保持一個穩定的內核源代碼介面，那麼就得創建一個新的介面
> +；舊的，有問題的介面必須一直維護，給Linux USB開發者帶來額外的工作。既然
>   所有的Linux USB驅動的作者都是利用自己的時間工作，那麼要求他們去做毫無意
>   義的免費額外工作，是不可能的。
>   安全問題對Linux來說十分重要。一個安全問題被發現，就會在短時間內得到修
> -正。在很多情況下，這將導致Linux內核中的一些接口被重寫，以從根本上避免安
> -全問題。一旦接口被重寫，所有使用這些接口的驅動程序，必須同時得到修正，
> +正。在很多情況下，這將導致Linux內核中的一些介面被重寫，以從根本上避免安
> +全問題。一旦介面被重寫，所有使用這些介面的驅動程序，必須同時得到修正，
>   以確定安全問題已經得到修復並且不可能在未來還有同樣的安全問題。如果內核
> -內部接口不允許改變，那麼就不可能修復這樣的安全問題，也不可能確認這樣的
> +內部介面不允許改變，那麼就不可能修復這樣的安全問題，也不可能確認這樣的
>   安全問題以後不會發生。
> -開發者一直在清理內核接口。如果一個接口沒有人在使用了，它就會被刪除。這
> -樣可以確保內核儘可能的小，而且所有潛在的接口都會得到儘可能完整的測試
> -（沒有人使用的接口是不可能得到良好的測試的）。
> +開發者一直在清理內核介面。如果一個介面沒有人在使用了，它就會被刪除。這
> +樣可以確保內核儘可能的小，而且所有潛在的介面都會得到儘可能完整的測試
> +（沒有人使用的介面是不可能得到良好的測試的）。
>   
>   
>   要做什麼
> @@ -128,11 +128,11 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>   
>   如果你寫了一個Linux內核驅動，但是它還不在Linux源代碼樹裏，作爲一個開發
>   者，你應該怎麼做？爲每個發佈的每個版本提供一個二進制驅動，那簡直是一個
> -噩夢，要跟上永遠處於變化之中的內核接口，也是一件辛苦活。
> +噩夢，要跟上永遠處於變化之中的內核介面，也是一件辛苦活。
>   很簡單，讓你的驅動進入內核源代碼樹（要記得我們在談論的是以GPL許可發行
>   的驅動，如果你的代碼不符合GPL，那麼祝你好運，你只能自己解決這個問題了，
>   你這個吸血鬼<把Andrew和Linus對吸血鬼的定義鏈接到這裏>）。當你的代碼加入
> -公版內核源代碼樹之後，如果一個內核接口改變，你的驅動會直接被修改接口的
> +公版內核源代碼樹之後，如果一個內核介面改變，你的驅動會直接被修改介面的
>   那個人修改。保證你的驅動永遠都可以編譯通過，並且一直工作，你幾乎不需要
>   做什麼事情。
>   
> @@ -142,7 +142,7 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
>       - 其他人會給驅動添加新特性。
>       - 其他人會找到驅動中的bug並修復。
>       - 其他人會在驅動中找到性能優化的機會。
> -    - 當外部的接口的改變需要修改驅動程序的時候，其他人會修改驅動程序
> +    - 當外部的介面的改變需要修改驅動程序的時候，其他人會修改驅動程序
>       - 不需要聯繫任何發行商，這個驅動會自動的隨着所有的Linux發佈一起發
>         布。
>   

