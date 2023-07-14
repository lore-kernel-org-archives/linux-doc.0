Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF29EB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 05:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbjGNFDU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbjGNFDT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 01:03:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B05B2D5F;
        Thu, 13 Jul 2023 22:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=vYGgiwi6McTgXJVwB+z2H4GZagJiz++rZZuJFwVAhog=; b=11Cfc2grFTHW81PM4huphD6u7b
        7QtstLh0AoPzH3AQqSgr3qBsnaE2oKv7wkOZnYtB3gvjGyqI1FoHGfsa8aLKPOWBhWZXWE5M9hfKd
        FTqqraHGvq/6ItQ9wW5b7z5/naEvQOvruHKx0wcXJDVBc5YmWYGWHUHLxXoKyYFBnTUPhQrUeGWRu
        n4lXZLvuOWjem1ymtqd1onFp+53dtvX6jSYUrqkiduU2lyoxtjrmfbwEC1hRX1WfEtxLybe6GamjZ
        dgLiKh5jQ6fy38Z0mHzA+3hWWpouZKt61qyxQSaPjTov+msGAdXBMZ6sM8W4bDRryY2ruhkyKC2sh
        IbzOBd9Q==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qKAxY-0051qn-0O;
        Fri, 14 Jul 2023 05:03:16 +0000
Message-ID: <d5727371-e580-a956-7846-b529f17048ca@infradead.org>
Date:   Thu, 13 Jul 2023 22:03:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH docs] scripts: kernel-doc: support private / public
 marking for enums
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org
References: <20230621223525.2722703-1-kuba@kernel.org>
 <399c98c8-fbf5-8b90-d343-e25697b2e6fa@infradead.org>
In-Reply-To: <399c98c8-fbf5-8b90-d343-e25697b2e6fa@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On 6/21/23 20:10, Randy Dunlap wrote:
> 
> 
> On 6/21/23 15:35, Jakub Kicinski wrote:
>> Enums benefit from private markings, too. For netlink attribute
>> name enums always end with a pair of __$n_MAX and $n_MAX members.
>> Documenting them feels a bit tedious.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.

I have a need for this patch. Are you planning to merge it?

in current linux-next docs build:

../include/drm/drm_connector.h:527: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'

That enum identifier could/should be marked as private:.

Thanks.

> 
>> ---
>> Hi Jon, we've CCed you recently on a related discussion
>> but it appears that the fix is simple enough so posting
>> it before you had a chance to reply.
>> ---
>>  scripts/kernel-doc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index 2486689ffc7b..66b554897899 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -1301,6 +1301,9 @@ sub dump_enum($$) {
>>      my $file = shift;
>>      my $members;
>>  
>> +    # ignore members marked private:
>> +    $x =~ s/\/\*\s*private:.*?\/\*\s*public:.*?\*\///gosi;
>> +    $x =~ s/\/\*\s*private:.*}/}/gosi;
>>  
>>      $x =~ s@/\*.*?\*/@@gos;	# strip comments.
>>      # strip #define macros inside enums
> 

-- 
~Randy
