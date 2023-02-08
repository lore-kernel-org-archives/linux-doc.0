Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7CBC636CC
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 14:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjBHOjH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 09:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjBHOjG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 09:39:06 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F4B21955
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 06:39:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id hx15so51598386ejc.11
        for <linux-doc@vger.kernel.org>; Wed, 08 Feb 2023 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mN+xzPL5moOWtOgIMPMqqth+yNdboSAJjl45j18mjgM=;
        b=VDCkCrIGYXzG/DkLNoglmcxfs3IbmarzDOwMJDSp9ar76nJ8CuEfcWTpRcvc95gBYV
         usWb43amllDH7Hjvcp8b4/miMuXQ2ZJxJfT2s+6cv/iHe57zEClL+NiAQHbn3UKyoQhG
         zTUWGZztZJUHAv4lKIr17bpMWFDZ6XaVoAIZYqlfbYe94SN1NnPEf1nsCXr1HAWm2Rci
         eegTF56I1kupQAkLEoLOBIdkCoiLPIHRS3oVies+PYaHOccDp6QBDCZMf12qz/Ln1g84
         0vZouaifdCv8u7TIdZ02md2Uql109z/rFruIEusQo6YNbqjDdf2bNFNAtE5b2Kyusgn0
         ag3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN+xzPL5moOWtOgIMPMqqth+yNdboSAJjl45j18mjgM=;
        b=ZJwzhee/c2f8wP3FKF72QQOXwzqxuZs296Yvi3G6b4GV4plqIVniQXcGfPRKsAiYga
         fSrFnPYm+pHWuwHPvNTnZiJugV40pw4zuHyuhbY78WwSIqM127zbbfET0Tn9lO5HfXnk
         m72VW5iqCWr/fEgEa3a7cm+/MTVf9PcfXOrcWIluaTVdBJxXTmkUc9ygfrq6LZKOsGnm
         ei83QkccTQaQUZRyzqiUfKBX2gwHziKoI2CXPk71C0+9QkrzVkJjb99L6fhvP8KEhijX
         4/qdRPYEm1bPsoyWc5B1SbNm7sq+6BGWZDVjdxWO4l+qaEadT74qZdpihEWQP4mDCvfp
         SZsg==
X-Gm-Message-State: AO0yUKUZo7pcZJ5OmvUCqomfb8b2nU3oA3B+4hYbXenLA4LSYoIiBQAW
        Kl4gXfbOeouvaHwgHb/cg0SFgA==
X-Google-Smtp-Source: AK7set9ZoYzkhwAambBbzzdZfXwBcCmRRVAectEK4VFmv2UdCsgjVruYz0R4976z4YB7Jg0k9R3Dww==
X-Received: by 2002:a17:906:5856:b0:86f:d0c9:4bdd with SMTP id h22-20020a170906585600b0086fd0c94bddmr7604854ejs.27.1675867142223;
        Wed, 08 Feb 2023 06:39:02 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id r14-20020a170906280e00b007a9c3831409sm8364392ejc.137.2023.02.08.06.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:39:01 -0800 (PST)
Date:   Wed, 8 Feb 2023 15:38:59 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     alejandro.lucero-palau@amd.com
Cc:     netdev@vger.kernel.org, linux-net-drivers@amd.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, habetsm.xilinx@gmail.com,
        ecree.xilinx@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
        jiri@nvidia.com
Subject: Re: [PATCH v6 net-next 2/8] sfc: add devlink info support for ef100
Message-ID: <Y+O0A5Bk/zWur76J@nanopsycho>
References: <20230208142519.31192-1-alejandro.lucero-palau@amd.com>
 <20230208142519.31192-3-alejandro.lucero-palau@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208142519.31192-3-alejandro.lucero-palau@amd.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Feb 08, 2023 at 03:25:13PM CET, alejandro.lucero-palau@amd.com wrote:
>From: Alejandro Lucero <alejandro.lucero-palau@amd.com>

[..]


>+static int efx_devlink_info_get(struct devlink *devlink,
>+				struct devlink_info_req *req,
>+				struct netlink_ext_ack *extack)
>+{
>+	struct efx_devlink *devlink_private = devlink_priv(devlink);
>+	struct efx_nic *efx = devlink_private->efx;
>+	int rc;
>+
>+	/* Several different MCDI commands are used. We report first error
>+	 * through extack along with total number of errors. Specific error
>+	 * information via system messages.

I think you forgot to remove this comment.

With this nit fixed, free free to add:
Reviewed-by: Jiri Pirko <jiri@nvidia.com>



>+	 */
>+	rc = efx_devlink_info_board_cfg(efx, req);
>+	if (rc) {
>+		NL_SET_ERR_MSG_MOD(extack, "Getting board info failed");
>+		return rc;
>+	}
>+	rc = efx_devlink_info_stored_versions(efx, req);
>+	if (rc) {
>+		NL_SET_ERR_MSG_MOD(extack, "Getting stored versions failed");
>+		return rc;
>+	}
>+	rc = efx_devlink_info_running_versions(efx, req);
>+	if (rc) {
>+		NL_SET_ERR_MSG_MOD(extack, "Getting running versions failed");
>+		return rc;
>+	}
>+
>+	return 0;
>+}
>+#endif

[..]

