Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB500EB64DC
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 03:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjFVDKe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 23:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjFVDKd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 23:10:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5213E57;
        Wed, 21 Jun 2023 20:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=k6qL3azBVdK09BVy1wBqnSuFf+QIbnoPMabf3e5Emf4=; b=4bU7th2gBdfb2Hshb1BJsOAy0B
        6twHVia1l+i2SpAe6fWhJfdXgyR0ZQ1RImAQhnPddxBPPU8QFb0yXHO5r3ONKlw6CT/jCKALDr0gh
        /XS6Cpc7geCPHR5l/RAJef1Ft5/QHpJcStag4ALELSLWh8prlg9zEDkrc4k5bdYhu7DvTdyK0zltm
        K5WEU5C0jQM5hZWQkl2KNIafPey2SeshVldiApA4pEonybx9V2/nu/0R04z37i12hTw+8R6hfFj/+
        ttydFWQ3jYlsIHZHokr8Gja6QBSo2VcCGsx/8DAFsmxZi+98IVa5Zpois1yJFxUNuPEEFmkNwpiUt
        R+p6VlRw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qCAiI-00GdUx-2O;
        Thu, 22 Jun 2023 03:10:27 +0000
Message-ID: <399c98c8-fbf5-8b90-d343-e25697b2e6fa@infradead.org>
Date:   Wed, 21 Jun 2023 20:10:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH docs] scripts: kernel-doc: support private / public
 marking for enums
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org
References: <20230621223525.2722703-1-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230621223525.2722703-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/21/23 15:35, Jakub Kicinski wrote:
> Enums benefit from private markings, too. For netlink attribute
> name enums always end with a pair of __$n_MAX and $n_MAX members.
> Documenting them feels a bit tedious.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Hi Jon, we've CCed you recently on a related discussion
> but it appears that the fix is simple enough so posting
> it before you had a chance to reply.
> ---
>  scripts/kernel-doc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 2486689ffc7b..66b554897899 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1301,6 +1301,9 @@ sub dump_enum($$) {
>      my $file = shift;
>      my $members;
>  
> +    # ignore members marked private:
> +    $x =~ s/\/\*\s*private:.*?\/\*\s*public:.*?\*\///gosi;
> +    $x =~ s/\/\*\s*private:.*}/}/gosi;
>  
>      $x =~ s@/\*.*?\*/@@gos;	# strip comments.
>      # strip #define macros inside enums

-- 
~Randy
