Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8625FEB64D9
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jul 2023 07:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjGDHuV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jul 2023 03:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGDHuU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jul 2023 03:50:20 -0400
X-Greylist: delayed 410 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 04 Jul 2023 00:50:19 PDT
Received: from st43p00im-ztfb10073301.me.com (st43p00im-ztfb10073301.me.com [17.58.63.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92EF9B
        for <linux-doc@vger.kernel.org>; Tue,  4 Jul 2023 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1688456608;
        bh=4ht9G50SlYlr7BPTCuy+KjNotHQlLEXbSKghIYlF3TI=;
        h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
        b=EIzMUdVmXlzkG5Z3HHHkSYlT/8fC2S2XMA7qKgdjReaEbpFuhzuSPHJwMQ0AV8LrP
         maMa7ij3aNzGMj/E/2cGvIq005+R8xgIGycGDZG0vWcD2QSxYtc5BkyGTyGH8h4JLM
         76Lw+3shtQmfqOAEyarm3MjrTXPRnimmD3o0me/I2AujD89WhTfMMuf5cyf06upISr
         TM9LVl5erV6b2pih1t7nS27h7LqBaeHjHcCjsWZxNj0vUZ6fH0A5efOtXD810YJbYZ
         abKyAYN842rn958DtJxr0iG6CVIAL9hyTNfLzu1poHqPtMcI7DGAt5yxJdSi59IYT6
         FWVx8Hi5A34Mg==
Received: from smtpclient.apple (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
        by st43p00im-ztfb10073301.me.com (Postfix) with ESMTPSA id 67837800069;
        Tue,  4 Jul 2023 07:43:28 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From:   "S. Isaeiela C. Escobar D. Anktnktr" <corpjane@icloud.com>
Mime-Version: 1.0 (1.0)
Date:   Tue, 4 Jul 2023 02:25:17 -0400
Subject: Re: [PATCH] proc.5: Clarify that boot arguments can be embedded in image
Message-Id: <AC915141-FB77-462E-8375-4D482AC8370B@icloud.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, hannes@cmpxchg.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mhiramat@kernel.org, mtk.manpages@gmail.com,
        ndesaulniers@google.com, vbabka@suse.cz
To:     paulmck@kernel.org
X-Mailer: iPhone Mail (20E252)
X-Proofpoint-GUID: y3ilcOdx3qM-iKroVvZHI1fflyx3bQAu
X-Proofpoint-ORIG-GUID: y3ilcOdx3qM-iKroVvZHI1fflyx3bQAu
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.170.22.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2023-02-09?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 mlxlogscore=493
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307040061
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Sent from my iPhone
