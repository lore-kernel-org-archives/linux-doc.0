Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA7BC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbiKUVvb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiKUVvC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:51:02 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFEDE075E
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:50:33 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id 8so9040803qka.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XOMV3vn81z+5751tt0TGjKBwkuDeuTgRvYeTdSlTG8=;
        b=NLFUWbVlKIRKVzxpGtgpPkzpIowhsMjYmIsLuHXpVCDB1Jq5pOEurZ6mtDZCdapY9B
         rmAS+1tXviwaK3JE4VQQWi23h63OaEAIoApFUGtyMPZNQBotkOYI7FmP+UC43Hc8z5lr
         /VlYkXgI7Xp9ZpfAODva75fEYnPKoElkfISK5AjtUReGZol/gtxICTg/tDAtPuFoOT+w
         XGDTxmlcxfz84g5coXrOe37evQawuNz4+snMUm0wjIlDffVEF6zfmYLFM43yVJOsBqJK
         O2UJJpUiKz0VOJsSoFVEKJ/zHjzaP88zP4oTot62TMRywjmXB/Hhjm+g+W6/Z9YVh0UI
         Qjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XOMV3vn81z+5751tt0TGjKBwkuDeuTgRvYeTdSlTG8=;
        b=BffCfEgEbfuPOIOE6/lCZUrP0rtwM2Kf4T1SapI0K60zLPQLNLgwnL9CsLVzkqiD60
         WbYqctCeeRqbzyV/2iyRYBecm/X35xsFYArmO8WKYLXvkn5v6BzPBb4OMevlPsL1c6FT
         ejX4JcXAzstrSkA+9R6yyatJEDAVkebWcL+LKseDMRdUArXEnrL8zSJ253ccORO4e6x5
         9dAXm764aQdzydWkOnYJfQhB3CqOEIlvs2zGLvTL2LbOLQd69EGYIix5NuDAMq/h99Pe
         ey6RlbVOCyaN23uwCSrk+IZyetJGm3fOPOWc8UKxzKOCjmJJ3TZm6eVRYdq4mH43y2cG
         dzZw==
X-Gm-Message-State: ANoB5plpyIulzOvH+h8W60Zm/eJLD0BJfP/9ZEoT5awWq0PMZjQZTzGQ
        MKwAcv3H09jksSu2iQ+i7UvyuzC4vjdGJA==
X-Google-Smtp-Source: AA0mqf6hzChIGAAOFlKClper6rN2Ry/+HrTgpzN18L2jYMOrrJDMbyV+R0KktIA0BGuD9O2ykyyt+w==
X-Received: by 2002:a37:2c83:0:b0:6fa:7ca:6165 with SMTP id s125-20020a372c83000000b006fa07ca6165mr824933qkh.775.1669067432018;
        Mon, 21 Nov 2022 13:50:32 -0800 (PST)
Received: from hurd ([2607:fad8:4:3::1003])
        by smtp.gmail.com with ESMTPSA id f1-20020ac84641000000b00343057845f7sm7143441qto.20.2022.11.21.13.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 13:50:31 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for
 the htmldocs target
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
        <20221116190210.28407-3-maxim.cournoyer@gmail.com>
        <8735ac9evv.fsf@meer.lwn.net>
Date:   Mon, 21 Nov 2022 16:50:30 -0500
In-Reply-To: <8735ac9evv.fsf@meer.lwn.net> (Jonathan Corbet's message of "Mon,
        21 Nov 2022 14:28:04 -0700")
Message-ID: <87tu2sou3d.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

Jonathan Corbet <corbet@lwn.net> writes:

> Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:
>
>> Having the generated HTML documentation under its own output
>> sub-directory makes it easier to install, since it's clean from
>> .doctrees or other output formats.
>>
>> Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
>> ---
>>  Documentation/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/Makefile b/Documentation/Makefile
>> index bb73dcb5ed05..bd8dac560633 100644
>> --- a/Documentation/Makefile
>> +++ b/Documentation/Makefile
>> @@ -93,7 +93,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>>  
>>  htmldocs:
>>  	@$(srctree)/scripts/sphinx-pre-install --version-check
>> -	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>> +	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),html,$(var)))
>
> I think I'm going to hold off on this one.  As I said before, it would
> have made sense to do things this way when we made the transition.  At
> this point, though, I think the potential for trouble outweighs the
> benefits that would come from moving things around in this way.

OK.  The potential for troubles would lie with the scripts to deploy the
doc to the web site, I'd guess?  If that's the place we'd expect
problems, I'm happy to be pointed to it and can try adjusting the
scripts for the change.

Otherwise, I can keep applying this small patch locally to my build, as
it makes it much easier to cleanly install both the HTML and info target
outputs when packaging the kernel and its documentation.

-- 
Thanks,
Maxim
