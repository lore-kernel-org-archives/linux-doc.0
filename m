Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AE2315D3E
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891387; cv=none; b=tMQgFvvraDjdJD2dn5Z+FbpzMrieI4ldZi9ayoaaDRwaKADYSH4eiZjdzndAAKFXh8HoDfW3TwTOeoGRPgRt9P/0AvDj9ET1KSbAuV/jhJXsDipn+GQfZvRFpvlzoE0xUpaKdpoZKEJgNsnsaM+DL4+gcGlmldSMkX3WZhBw908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891387; c=relaxed/simple;
	bh=B5ZLbfI1uVFhQvgFDzgTOWNZnzlhwrqAeg/AlYkjQ+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZkdTdITo8JGNTQ5E+SXV71nR71gEDtkZFnjqZGevqAg8mKgiijwGYChmxvPTUNQI5CxvU1x6qek7eK6JFnFmgFqfR9sYoYrlQTD5z84PGM+d/Ec/CTAy3L4m90LbqMF61Lnms8n7+WB2yyiLaCf641x6iIIGo9MXXewn55K9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=w2a7+Pp6; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="w2a7+Pp6"
Date: Fri, 24 Jul 2026 19:06:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784891228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tGziK/7tAgwxNl+rpnU1Nn3yWSt9gTZHfj77DKqQG8=;
	b=w2a7+Pp6fm0qNBFFizLgjzF46ODNxuGxqkebtIpDgnWb7tHyqYaDicgmY1wTyaq0dbt2Or
	75QTGgpJOkTq5oPDZkuZG3NGf2iGBArCt0kE5P5G61ZPVQoK4ntrH7X5G6YjFBD9Vjms9U
	nN78yF1k/gVYSJ6fnsGddwZXd96xgW1WbQj0qk635lFJvQBPBeqi36Dsfi1bkVBpQcb6tE
	58QaCV8fIkHZ+HDf+od7CTmNQuz0E0XXsfWKqaKrDBfJEqCIj+eDQq0YizZOWXKivN/jjG
	zsWpQl0vPVC5s0zo7Fw/V+L17OyHwgn88z+oPw/hGawQRU9ZR9VtNJ9i8xqdnQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/16] docs/zh_TW: process: localize terminology in
 submitting-patches.rst
Message-ID: <amNHU60OL_HjMWbX@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-14-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-14-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:39AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 文件→檔案,
> 代碼→程式碼, ...) and sync with the English original: subspace.kernel.org
> list info, interleaved-reply etiquette section, reworked Acked-by
> semantics with "# Suffix", tagging-people permission rules, the
> Assisted-by: section, canonical patch format subsections with
> affiliation format and previous-version links, and the b4 tooling
> section. Cross references now point at zh_TW translations and broken
> zh_-prefixed ref targets are fixed to tw_.
> 
> update to commit 48c3876a6a6f ("docs: submitting-patches: Clarify that "reviewer" is a person")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/submitting-patches.rst      | 503 +++++++++++-------
>  1 file changed, 296 insertions(+), 207 deletions(-)
> 

[...]

> @@ -138,41 +139,41 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
>  
>  將每個 **邏輯更改** 拆分成一個單獨的補丁。
>  
> -例如，如果你的改動裏同時有bug修正和性能優化，那麼把這些改動拆分到兩個或
> -者更多的補丁文件中。如果你的改動包含對API的修改，並且增加了一個使用該新API
> +例如，如果你的改動裡同時有bug修正和效能最佳化，那麼把這些改動拆分到兩個或
> +者更多的補丁檔案中。如果你的改動包含對API的修改，並且增加了一個使用該新API
>  的驅動，那麼把這些修改分成兩個補丁。
>  
> -另一方面，如果你將一個單獨的改動做成多個補丁文件，那麼將它們合併成一個
> -單獨的補丁文件。這樣一個邏輯上單獨的改動只被包含在一個補丁文件裏。
> +另一方面，如果你將一個單獨的改動做成多個補丁檔案，那麼將它們合併成一個
> +單獨的補丁檔案。這樣一個邏輯上單獨的改動只被包含在一個補丁檔案裡。
>  
>  需要記住的一點是，每個補丁的更改都應易於理解，以便審閱者驗證。每個補丁都應該
>  對其價值進行闡述。
>  
>  如果有一個補丁依賴另外一個補丁來完成它的改動，那沒問題。直接在你的補
> -丁描述裏指出 **“這個補丁依賴某補丁”** 就好了。
> +丁描述裡指出 **“這個補丁依賴某補丁”** 就好了。

move "丁" to the line above. i.e.

如果有一個補丁依賴另外一個補丁來完成它的改動，那沒問題。直接在你的補丁
描述...

[...]

>  簽署你的作品——開發者來源認證
>  ------------------------------
>  
> -爲了加強對誰做了何事的追蹤，尤其是對那些透過好幾層維護者才最終到達的補丁，我
> -們在通過郵件發送的補丁上引入了“簽署（sign-off）”流程。
> +為了加強對誰做了何事的追蹤，尤其是對那些透過好幾層維護者才最終到達的補丁，我
> +們在透過郵件發送的補丁上引入了“簽署（sign-off）”流程。
>  
> -“簽署”是在補丁註釋最後的一行簡單文字，認證你編寫了它或者其他
> -人有權力將它作爲開放源代碼的補丁傳遞。規則很簡單：如果你能認證如下信息:
> +“簽署”是在補丁註解最後的一行簡單文字，認證你編寫了它或者其他
> +人有權力將它作為開放原始程式碼的補丁傳遞。規則很簡單：如果你能認證如下資訊:
>  
>  開發者來源認證 1.1
>  ^^^^^^^^^^^^^^^^^^
>  
> -對於本項目的貢獻，我認證如下信息：
> +對於本專案的貢獻，我認證如下資訊：
>  
> -       (a) 這些貢獻是完全或者部分的由我創建，我有權利以文件中指出
> -           的開放源代碼許可證提交它；或者
> +       (a) 這些貢獻是完全或者部分的由我建立，我有權利以文件中指出
> +           的開放原始程式碼許可證提交它；或者
>  
>         (b) 這些貢獻基於以前的工作，據我所知，這些以前的工作受恰當的開放
> -           源代碼許可證保護，而且，根據文件中指出的許可證，我有權提交修改後的貢獻，
> -           無論是完全還是部分由我創造，這些貢獻都使用同一個開放源代碼許可證
> +           原始程式碼許可證保護，而且，根據文件中指出的許可證，我有權提交修改後的貢獻，
> +           無論是完全還是部分由我創造，這些貢獻都使用同一個開放原始程式碼許可證
>             （除非我被允許用其它的許可證）；或者
>  
>         (c) 這些貢獻由認證（a），（b）或者（c）的人直接提供給我，而
>             且我沒有修改它。
>  
> -       (d) 我理解並同意這個項目和貢獻是公開的，貢獻的記錄（包括我
> -           一起提交的個人記錄，包括sign-off）被永久維護並且可以和這個項目
> -           或者開放源代碼的許可證同步地再發行。
> +       (d) 我理解並同意這個專案和貢獻是公開的，貢獻的記錄（包括我
> +           一起提交的個人記錄，包括sign-off）被永久維護並且可以和這個專案
> +           或者開放原始程式碼的許可證同步地再發行。

For the translation of DCO, I have the same concern with Akira:

  https://lore.kernel.org/linux-doc/c8c36d99-9c0a-4767-8a4e-a5ad28093530@gmail.com/

Could it be better if adding a sentence like:

    "The translation is for reference only and has no legal
    effect. Please refer to the original text."

I guess that would be better for all the translation versions.

Btw, I think GNU translation team did a good job for this situation:

  https://www.gnu.org/licenses/translations.html

Maybe we can take a look then see what's the best solution for this.

>  那麼加入這樣一行::
>  
> @@ -342,30 +365,44 @@ Signed-off-by: 標籤表示簽名者參與了補丁的開發，或者他/她在
>  如果一個人沒有直接參與補丁的準備或處理，但希望表示並記錄他們對補丁的批准/贊成，
>  那麼他們可以要求在補丁的變更日誌中添加一個Acked-by:。
>  
> -Acked-by: 通常由受影響代碼的維護者使用，當該維護者既沒有貢獻也沒有轉發補丁時。
> +Acked-by: 供以某種方式對受影響程式碼負責或與之相關的人使用。最常見的情況是，
> +當維護者既沒有貢獻也沒有轉發補丁時，由該維護者使用。
> +
> +Acked-by: 也可以由其他利益相關者使用，例如具有領域知識的人（例如被修改程式
> +碼的原作者）、核心uAPI補丁的使用者空間側審閱者，或某項功能的關鍵使用者。在
> +這些情況下，可以視需要加上一個“# 後綴”以澄清其含義::
> +
> +	Acked-by: The Stakeholder <stakeholder@example.org> # As primary user
>  
[...]
>  
> -Reviewed-by：根據審閱者的監督聲明，表明該補丁已被審閱並被認爲是可接受的：
> +Reviewed-by：根據審閱者的監督聲明，表明該補丁已被審閱並被認為是可接受的：
>  
>  
>  審閱者的監督聲明
>  ^^^^^^^^^^^^^^^^
>  
> -通過提供我的Reviewed-by:標籤，我聲明：
> +透過提供我的Reviewed-by:標籤，我聲明：
>  
>          (a) 我已經對這個補丁進行了一次技術審閱，以評估它是否適合被包含到
> -            主線內核中。
> +            主線核心中。
>  
>          (b) 與補丁相關的任何問題、顧慮或問題都已反饋給提交者。我對提交者對
>              我的評論的回應感到滿意。
>  
> -        (c) 雖然這一提交可能仍可被改進，但我相信，此時，（1）對內核
> +        (c) 雖然這一提交可能仍可被改進，但我相信，此時，（1）對核心
>              進行了有價值的修改，（2）沒有包含爭論中涉及的已知問題。
>  
> -        (d) 雖然我已經審閱了補丁並認爲它是健全的，但我不會（除非另有明確
> -            說明）作出任何保證或擔保它會在任何給定情況下實現其規定的目的
> -            或正常運行。
> +        (d) 雖然我已經審閱了補丁並認為它是健全的，但我不會（除非另有明確
> +            說明）作出任何保證或擔保它會在任何給定情況下實作其規定的目的
> +            或正常執行。
>  
> -Reviewed-by是一種觀點聲明，即補丁是對內核的適當修改，沒有任何遺留的嚴重技術
> -問題。任何感興趣的審閱者（完成工作的人）都可以爲一個補丁提供一個Reviewed-by
> -標籤。此標籤用於向審閱者提供致謝，並通知維護者補丁的審閱進度。
> +Reviewed-by是一種觀點聲明，即補丁是對核心的適當修改，沒有任何遺留的嚴重技術
> +問題。任何感興趣的審閱者（完成了審閱工作且具有已知身分的人）都可以為一個補丁提供
> +一個Reviewed-by標籤。此標籤用於向審閱者提供致謝，並通知維護者補丁的審閱進度。
>  當Reviewed-by:標籤由已知了解主題區域並執行徹底檢查的審閱者提供時，通常會增加
> -補丁進入內核的可能性。
> +補丁進入核心的可能性。
>  
>  一旦從測試人員或審閱者的“Tested-by”和“Reviewed-by”標籤出現在郵件列表中，
>  作者應在發送下一個版本時將其添加到適用的補丁中。但是，如果補丁在以下版本中發
> -生了實質性更改，這些標籤可能不再適用，因此應該刪除。通常，在補丁更改日誌中
> -（在 ``---`` 分隔符之後）應該提到刪除某人的測試者或審閱者標籤。
> +生了實質性更改，這些標籤可能不再適用，因此應該刪除。通常，刪除某人的Acked-by、Tested-by或Reviewed-by標籤時，應在補丁更改日誌中
> +（在 ``---`` 分隔符之後）提及並附上解釋。

forgot to wrap here ;-)

>  
>  Suggested-by: 表示補丁的想法是由指定的人提出的，並確保將此想法歸功於指定的
> -人。請注意，未經許可，不得添加此標籤，特別是如果該想法未在公共論壇上發佈。
> -也就是說，如果我們勤快地致謝創意提供者，他們將受到鼓舞，很有希望在未來再次
> -幫助我們。
> +人：如果我們勤快地致謝創意提供者，他們將受到鼓舞，很有希望在未來再次幫助
> +我們。注意，這是僅有的三個可以在未經被指名者明確許可的情況下使用的標籤之一
> +（詳見下面的“標記他人需要許可”）。
>  
> -Fixes: 指示補丁修復了之前提交的一個問題。它可以便於確定錯誤的來源，這有助於
> -檢查錯誤修復。這個標籤還幫助穩定內核團隊確定應該接收修復的穩定內核版本。這是
> -指示補丁修復的錯誤的首選方法。請參閱 :ref:`zh_describe_changes` 瞭解更多信息。
> +Fixes: 指示補丁修復了之前提交中的一個缺陷。它可以便於確定問題的來源，這有助於
> +檢查錯誤修復。這個標籤還幫助穩定核心團隊確定應該接收修復的穩定核心版本。這是
> +指示補丁修復的錯誤的首選方法。請參閱 :ref:`tw_describe_changes` 瞭解更多資訊。
>  
>  .. note::
>  
> -  附加Fixes:標籤不會改變穩定內核規則流程，也不改變所有穩定版補丁抄送
> -  stable@vger.kernel.org的要求。有關更多信息，請閱讀
> -  Documentation/translations/zh_CN/process/stable-kernel-rules.rst 。
> +  附加Fixes:標籤不會改變穩定核心規則流程，也不改變所有穩定版補丁抄送
> +  stable@vger.kernel.org的要求。有關更多資訊，請閱讀
> +  Documentation/translations/zh_TW/process/stable-kernel-rules.rst 。
> +
> +最後，雖然提供標籤是受歡迎的且通常非常受讚賞，但請注意，簽署者（即提交者和
> +維護者）可以自行斟酌是否採用所提供的標籤。
> +
> +.. _tw_tagging_people:
> +
> +標記他人需要許可
> +----------------
> +
> +在補丁中添加上述標籤時要小心：除了Cc:、Reported-by:和Suggested-by:之外，
> +所有標籤都需要被指名者的明確許可。對於這三個標籤，如果根據lore存檔或提交
> +歷史，該人曾以該名字和電子郵件地址對Linux核心做出過貢獻，那麼隱含的許可
> +就足夠了——並且對於Reported-by:和Suggested-by:，報告或建議必須是公開作出
> +的。注意，就此而言bugzilla.kernel.org是公開場所，但其中使用的電子郵件地址
> +是私密的；因此不要在標籤中暴露它們，除非該人在先前的貢獻中使用過。
> +
> +使用Assisted-by:
> +----------------
> +
> +如果您在建立補丁的過程中使用了任何進階編碼工具，您需要透過添加Assisted-by
> +標籤來聲明這一使用。不這樣做可能會妨礙您的工作被接受。關於聲明編碼助手的
> +細節，請參見 Documentation/process/coding-assistants.rst 。

As I said before, for this trailer, there are many discussions happening
recently.

As far as I know, it seems that there would be a final decision in LPC
2026 soon (Oct.5-7), so let's mark this into our TODO notebook for later
potential changes.

(Ah, I found that we don't have process/coding-assistants.rst translated
yet, so not very urgent.)

Other parts of this patch seems good.

Thanks.
