Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620AB2673AA;
	Fri,  7 Aug 2026 01:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065869; cv=none; b=euuR3+Xdh6RlVxsE7hgY183JZuqgU0i8HnS35hSsIFgBeJ8OD5/eMuhFmzLKp95+mOSqDg5e8e6H4b4uXqIkvB0tQCh56NJE+uOQn2X15t92TK+VTLhZb5s3irnHbKBH6YWDq3BiVI7yum+10Dr/AToRu6PBMBv2yVMaPWfnBHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065869; c=relaxed/simple;
	bh=ptQStXfTFAEKrrZacnb8aW7hcW14aNs36kTKHWY0pKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXb0RJvWkN6+1t2O2RWK7sfp5xG+/+0tMoMFrc66PMXvEQezqGiyZ40Vd+nb98kTPvaf1QQ4yMXxEvbuOby4lipytElblM56CvOXlunhvxdvvZMYXvVCUfZ8ISJSbl2WYQtpOUpVtjUuXeqqTMor4YIp5PDwD/pBwgwsIVHGJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAA3DqOwM3VqqmQOAw--.44453S2;
	Fri, 07 Aug 2026 09:24:00 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXEMSpM3VqFooQAQ--.44907S2;
	Fri, 07 Aug 2026 09:23:54 +0800 (CST)
Message-ID: <de2ddee4-7907-42bc-bc2f-af9f6d5bb613@hust.edu.cn>
Date: Fri, 7 Aug 2026 09:23:53 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync
 process/ documents
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>, Weijie Yuan <wy@wyuan.org>,
 Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260806181949.65648-1-chenyou910331@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAA3DqOwM3VqqmQOAw--.44453S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3CFWDAFyfKFWkKF1ktF4fXwb_yoW8AFWfto
	WfCwsrAr1xWr1DX3WUCws5CFy3GrZ3Crsayr15t3Wq93s0g3WxGr47Zwn0vas3Zr15Wa93
	XFyIy3y5tF1kAa4rn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOk7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI
	0_JF0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCE
	c2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14
	v26r4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWx
	Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Hi Chen-Yu,

It seems like this patch series missed [PATCH v3 16/16]. I 
double-checked the lore.kernel.org and the same to the LKML.

Please double check your network connection or patch submission.

Dongliang Mu

On 8/7/26 2:19 AM, Chen-Yu Yeh wrote:
> The zh_TW (Traditional Chinese) translations were originally converted
> from the zh_CN tree, so they still use mainland Chinese terminology
> (e.g. 內核, 軟件, 接口) that reads unnatural to Taiwanese readers, and
> most of the process/ documents have fallen behind their English
> originals.
>
> This series localizes the terminology of the existing zh_TW process/
> documents to Taiwanese Mandarin and, in the same pass, syncs each
> document with its current English original, so that the "update to
> commit" markers stay honest for tools/docs/checktransupdate.py.
>
> Each patch covers one document and does both the terminology
> localization and the content sync for it. Notable content syncs
> include:
>
>    - code-of-conduct-interpretation: new "Enforcement for Unacceptable
>      Behavior" section and updated TAB voting language
>    - stable-kernel-rules: retranslated from the heavily restructured
>      English text (three submission options, stable tag variants)
>    - submitting-patches: interleaved-reply etiquette, reworked Acked-by
>      semantics, tagging-people permission rules, Assisted-by:, canonical
>      patch format subsections and the b4 tooling section
>    - embargoed-hardware-issues: "Early access" section and the current
>      ambassadors list
>    - index: mirrors the reworked English process index layout
>    - programming-language: Rust is no longer experimental
>
> The final patch adds Documentation/translations/zh_TW/glossary.rst,
> which documents the terminology mapping used across the series (with
> zh_CN equivalents for cross-reference) so that reviewers can check the
> replacements against a single reference, and future translations can
> stay consistent.
>
> A short summary of the main mappings (English / zh_TW / old zh_CN-style):
>
>    kernel      核心   (內核)      software    軟體   (軟件)
>    interface   介面   (接口)      memory      記憶體 (內存)
>    process     行程   (進程)      queue       佇列   (隊列)
>    network     網路   (網絡)      server      伺服器 (服務器)
>    default     預設   (默認)      user        使用者 (用戶)
>    code        程式碼 (代碼)      file        檔案   (文件)
>    community   社群   (社區)      documentation 文件 (文檔)
>
> On tooling: this series was prepared with LLM assistance -- an
> assistant drafted the initial localization of each document and the
> glossary, and I then reviewed every line by hand, checking each
> terminology choice as a native speaker, verifying the "update to
> commit" baselines against git log, and building the docs. That review
> is where the substantive fixes came from, including the two glossary
> corrections below. The patches carry Assisted-by: trailers
> accordingly.
>
> Two items are deliberately left for after this series, as noted by
> Weijie during review: a legal disclaimer for the DCO translation
> (which affects all locales), and the rendering of "Linux Foundation
> Fellow".
>
> Changes since v2:
>    - Collected review tags; every patch except 2.Process now carries
>      Weijie Yuan's Reviewed-by or Acked-by. The tag for 2.Process has
>      simply not arrived yet.
>    - Added an Assisted-by: trailer to every patch, per
>      Documentation/process/coding-assistants.rst.
>    - glossary: corrected two entries in the zh_CN reference column
>      (建置 -> 构建, 账户 -> 帐户) after checking every term against
>      Documentation/translations/zh_CN/ by occurrence count, and added a
>      note recording that provenance (Alex Shi).
>    - glossary: documented the CJK/ASCII spacing convention.
>    - code-of-conduct-interpretation: two wording improvements in the
>      "Enforcement for Unacceptable Behavior" section (加以糾正 instead of
>      作出彌補, and 對這類報告進行調查並予以處理 instead of 調查並解決
>      這些報告) (Weijie Yuan).
>    - 2.Process: dropped the space in 維護 staging樹, following the
>      CJK/ASCII spacing rule now documented in the glossary. The zh_TW
>      tree is 2581 occurrences without a space to 721 with (Weijie Yuan).
>
> Changes since v1:
>    - Collected the first review tags from Weijie Yuan.
>    - Folded every "update to commit" line to <=72 columns (the no-wrap
>      rule only applies to machine-parsed Fixes: tags; checktransupdate.py
>      only greps the hash, so folding the title is safe).
>    - Reflowed paragraphs that ran over the line width after localization,
>      and kept the word 補丁 from splitting across a line break.
>    - Wording/terminology fixes: 7.AdvancedTopics 免費->自由 (free as in
>      freedom); howto restored the published book titles, fixed a 歡迎
>      typo, and 存取->造訪 for "visit a website"; 2.Process
>      LinusTorvalds->Linus Torvalds; embargoed-hardware-issues 行程->流程
>      and 早期取得->提前取得; 8.Conclusion updated the stale LWN URLs.
>    - Fixed "Greg Kroah Hartman" -> "Greg Kroah-Hartman" in 2.Process,
>      embargoed-hardware-issues and 8.Conclusion (the English originals
>      hyphenate it).
>    - glossary: added entries for access vs visit (存取/造訪), mailing list
>      (郵件列表), the -stable convention, and a note that the rendering of
>      "Fellow" is still under discussion.
>
> The zh_TW documents were built with "make SPHINXDIRS=translations
> htmldocs" without new warnings, and tools/docs/checktransupdate.py -l
> zh_TW now reports the series' documents as up to date.
>
> Chen-Yu Yeh (16):
>    docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
>    docs/zh_TW: process: localize terminology in 1.Intro.rst
>    docs/zh_TW: process: localize terminology in
>      code-of-conduct-interpretation.rst
>    docs/zh_TW: process: localize terminology in license-rules.rst
>    docs/zh_TW: process: localize terminology in email-clients.rst
>    docs/zh_TW: process: localize terminology in programming-language.rst
>    docs/zh_TW: process: localize terminology in coding-style.rst
>    docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
>    docs/zh_TW: process: localize terminology in 5.Posting.rst
>    docs/zh_TW: process: localize terminology in 2.Process.rst
>    docs/zh_TW: process: localize terminology in howto.rst
>    docs/zh_TW: process: localize terminology in
>      embargoed-hardware-issues.rst
>    docs/zh_TW: process: localize terminology in submitting-patches.rst
>    docs/zh_TW: process: localize terminology in 8.Conclusion.rst
>    docs/zh_TW: process: localize terminology in index.rst
>    docs/zh_TW: Add a glossary for Traditional Chinese translations
>
>   Documentation/translations/zh_TW/glossary.rst | 168 +++++
>   Documentation/translations/zh_TW/index.rst    |   5 +-
>   .../translations/zh_TW/process/1.Intro.rst    | 235 +++----
>   .../translations/zh_TW/process/2.Process.rst  | 325 +++++----
>   .../translations/zh_TW/process/5.Posting.rst  | 235 ++++---
>   .../zh_TW/process/7.AdvancedTopics.rst        | 110 ++--
>   .../zh_TW/process/8.Conclusion.rst            |  58 +-
>   .../code-of-conduct-interpretation.rst        | 162 +++--
>   .../zh_TW/process/coding-style.rst            | 614 +++++++++---------
>   .../zh_TW/process/email-clients.rst           | 185 +++---
>   .../process/embargoed-hardware-issues.rst     | 209 +++---
>   .../translations/zh_TW/process/howto.rst      | 344 +++++-----
>   .../translations/zh_TW/process/index.rst      |  99 ++-
>   .../zh_TW/process/license-rules.rst           | 203 +++---
>   .../zh_TW/process/programming-language.rst    |  98 ++-
>   .../zh_TW/process/stable-kernel-rules.rst     | 256 ++++++--
>   .../zh_TW/process/submitting-patches.rst      | 556 +++++++++-------
>   17 files changed, 2251 insertions(+), 1611 deletions(-)
>   create mode 100644 Documentation/translations/zh_TW/glossary.rst
>
> 對 v2 的範圍差異：
>   1:  86145e74b417 !  1:  0b1c9f30ec6a docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
>      @@ Commit message
>           update to commit 5ce70894f6ca ("Doc: correct spelling and wording
>           mistakes")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/7.AdvancedTopics.rst ##
>   2:  a7e8d67386c4 !  2:  cbb74f5f80d4 docs/zh_TW: process: localize terminology in 1.Intro.rst
>      @@ Commit message
>           mistakes")
>       
>           Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/1.Intro.rst ##
>   3:  ab1f2e61a013 !  3:  06b80ff9c513 docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
>      @@ Commit message
>           update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
>           role in enforcement decisions")
>       
>      +    Acked-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst ##
>      @@ Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
>       +澄清開發過程和行為準則的範圍來解決。
>       +
>       +不可接受的行為可能在短時間內中斷相互尊重的協作，並對社群的健康造成長期的
>      -+負面影響。當個人在違規發生的場合承認自己的行為並作出彌補時，不可接受的行為
>      ++負面影響。當個人在違規發生的場合承認自己的行為並加以糾正時，不可接受的行為
>       +通常就能得到解決。
>       +
>       +當不可接受的行為未能透過社群討論解決時，行為準則委員會會收到相關報告。當
>      @@ Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
>       +恢復有成效且相互尊重的協作。
>       +
>       +行為準則委員會有義務對報告和報告者的資訊保密。報告可能來自受害方，也可能
>      -+來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，調查
>      -+並解決這些報告。
>      ++來自目睹不可接受行為的社群成員。行為準則委員會有責任與所有相關方合作，對這
>      ++類報告進行調查並予以處理。
>       +
>       +行為準則委員會與當事人合作，促使其理解以下事項的重要性：修復其行為對受害方
>       +造成的傷害，以及對社群的長期負面影響。
>   4:  433467e0d42d !  4:  23eccf9e4329 docs/zh_TW: process: localize terminology in license-rules.rst
>      @@ Commit message
>           update to commit ebf1bafd0907 ("LICENSES: Explicitly allow
>           SPDX-FileCopyrightText")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/license-rules.rst ##
>   5:  043c305381fa !  5:  d7273d32b601 docs/zh_TW: process: localize terminology in email-clients.rst
>      @@ Commit message
>           update to commit 4971ca2007e3 ("docs: process: email-client: add
>           Thunderbird "Toggle Line Wrap" extension")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/email-clients.rst ##
>   6:  3c0b05e83bd1 !  6:  64abaab348f5 docs/zh_TW: process: localize terminology in programming-language.rst
>      @@ Commit message
>            git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux")
>       
>           Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/programming-language.rst ##
>   7:  8981444a4b97 !  7:  9c52e54cdf4a docs/zh_TW: process: localize terminology in coding-style.rst
>      @@ Commit message
>           kmalloc_objs example in coding style doc")
>       
>           Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/coding-style.rst ##
>   8:  6cdeb3a74ab2 !  8:  98bc1d2cd925 docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
>      @@ Commit message
>           update to commit 10466b17af65 ("docs: stable-kernel-rules: fix typo
>           sent->send")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/stable-kernel-rules.rst ##
>   9:  cb394d7972ca !  9:  6929c040bd0c docs/zh_TW: process: localize terminology in 5.Posting.rst
>      @@ Commit message
>           testing")
>       
>           Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/5.Posting.rst ##
> 10:  45c1ff334b3c ! 10:  6d6a2939330d docs/zh_TW: process: localize terminology in 2.Process.rst
>      @@ Commit message
>       
>           update to commit 46298375477b ("linux-next: update maintainer info.")
>       
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/2.Process.rst ##
>      @@ Documentation/translations/zh_TW/process/2.Process.rst: Next 樹
>       -目錄中還應該有一個TODO文件。TODO文件列出了驅動程序需要接受的暫停的工作，
>       -以及驅動程序的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
>       -程序必須至少正確編譯。
>      -+Greg Kroah-Hartman 目前負責維護 staging樹。仍需要修正的驅動程式將發送給他，
>      ++Greg Kroah-Hartman 目前負責維護staging樹。仍需要修正的驅動程式將發送給他，
>       +每個驅動程式在drivers/staging/中都有自己的子目錄。除了驅動程式原始檔之外，
>       +目錄中還應該有一個TODO檔案。TODO檔案列出了驅動程式需要接受的暫停的工作，
>       +以及驅動程式的任何補丁都應該抄送的人員列表。當前的規則要求，staging的驅動
> 11:  3f31ba1537f1 ! 11:  83f29fd898fd docs/zh_TW: process: localize terminology in howto.rst
>      @@ Commit message
>           update to commit 413e775efaec ("Documentation: fix links to mailing list
>           services")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/howto.rst ##
> 12:  53027228f3ae ! 12:  068a55b1cb6d docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
>      @@ Commit message
>       
>           update to commit cead34ac1ce1 ("MAINTAINERS: update ndesaulniers")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst ##
> 13:  96042d7d0d6d ! 13:  6892bbeca210 docs/zh_TW: process: localize terminology in submitting-patches.rst
>      @@ Commit message
>           代碼→程式碼, ...) and sync with the English original: subspace.kernel.org
>           list info, interleaved-reply etiquette section, reworked Acked-by
>           semantics with "# Suffix", tagging-people permission rules, the
>      -    Assisted-by: section, canonical patch format subsections with
>      +    Assisted-by tag, canonical patch format subsections with
>           affiliation format and previous-version links, and the b4 tooling
>           section. Cross references now point at zh_TW translations and broken
>           zh_-prefixed ref targets are fixed to tw_.
>      @@ Commit message
>           update to commit 48c3876a6a6f ("docs: submitting-patches: Clarify that
>           "reviewer" is a person")
>       
>      +    Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/submitting-patches.rst ##
> 14:  08639614b887 ! 14:  2f9e8c76e5b2 docs/zh_TW: process: localize terminology in 8.Conclusion.rst
>      @@ Commit message
>       
>           Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>           Reviewed-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/8.Conclusion.rst ##
> 15:  19f60aa7030c ! 15:  61f97350c6bd docs/zh_TW: process: localize terminology in index.rst
>      @@ Commit message
>           what is and is not a security bug")
>       
>           Acked-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/process/index.rst ##
> 16:  70b566b1579c ! 16:  068c34f11fe9 docs/zh_TW: Add a glossary for Traditional Chinese translations
>      @@ Commit message
>           process/ documents in this series.
>       
>           Acked-by: Weijie Yuan <wy@wyuan.org>
>      +    Assisted-by: Claude:claude-opus-5
>           Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>       
>        ## Documentation/translations/zh_TW/glossary.rst (new) ##

