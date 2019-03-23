Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 51E307D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 23 Mar 2019 10:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfCWKJz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 23 Mar 2019 06:09:55 -0400
Received: from sonic305-1.consmr.mail.bf2.yahoo.com ([74.6.133.40]:35474 "EHLO
        sonic305-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726085AbfCWKJy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Mar 2019 06:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1553335793; bh=yGtSPoZ+plA+4G7dBrNsfe9398JFtXYFL/4Uac0g7aQ=; h=Date:From:Reply-To:Subject:References:From:Subject; b=c1l3QnKy8QJnZScd0dE66JkbhzhbxNX9NahHBOdv0VHIe+BQYOHVq93grWRe53ko+d2oW+16anCgd0LVwnowYRlGqfOWyAK2RQ5TMJWc9PINZl/riDnos8/eEGV1Quvtj4sOCSnjZbhB7ZFUNIgslE8b46I4aYK1y7WVsX5UPes61jCOodihDKnZp6aFq0B6VCEpDLE4PKDoGnlqNJ4Z7KWHbr6p6nQlISh5m4JatYOJFEZ27t9NWTD3VU0xE48v/sYK9OakLaP/UAZmGdtZEbkvol4qA5e0CYbhYqCpzFed0zfySV4G8i9/QqTrbAIEhd+sIpABmtbKj2Vnn7beAQ==
X-YMail-OSG: K__JC0AVM1nOWxXE_Q.1W6d9vQQdebHOkWqT9wE.SOugKTxLu2L5KPlKmTrF4e4
 ULAnQitqhADuZNWnQq121hKAZJfKY1V8hPRknIUxtZhA76GYzkuc49ncYkKDhOwi7c6YY2J5Vyny
 3u3d_OesUp4VwtBOQKZyNIy.d85CVGhUovejCublD7PEQOpRF00EJXo7qRNdLaGDdng2kG9oes1e
 2_.gpX0QgQoz_5SQUGnGLTE16wZWM_7XkWFc3hdUOlDgYBgzLAOPtya1RpV3.bpvog4c1airtQwW
 cYbmyxgYMqWRWMoc.N2D2XJ2xTo3z9R_qD.47ow6AHZmn2jQXNlMMrGbQsssq3TcgRSFYVkp7DGA
 mXfuhy3yOsXcj8vh1tMhsjt6F.LwgpbLhHgj4P_T1xpWpPwOHTYUQxisFsXSRFMYpsBH9kPipd0J
 wGHfY2ncUCQx7_38tz0hBfTHnVsmSfIXbrm_WIsvMBnB1yV_hjCwwjAlx_gNYhcuBC4M1EI433Oo
 QUVye9V2G_sOfvO8ddImDCB33FKNwOmoo5.asUzhqPNiJbo4GTM2ChxlMDmwoM_35s5hJqdep5tg
 Gj3Ykp6Y7cIiuTewKCIjqJj4OwNFqU6JEbC.N_vjHsotsn1LiMJ_4Df1jmh5HzR6ZSVbBitN.UBw
 k29ncXW.AIUxi.CON4G965kAacrhwGV7n0MefNG_pOwkWA2KORwzXrgSizDTAOWg7n06Dgq5XrnH
 _CQydc2jmEf7.nCEHFAPC9rloxiWj9bN4diu30OCy69mRYc3wDulIA2BhNITPtlNuWac3Fyznnea
 IYf7_C84mqqFMqWMTt0esSD9Kv7y6pnhcHo2WGYmC21esqRJvvpLg4Xny7OM.6lBsjvF2w5gh4eu
 ._9FI8pe27Tyy05aaDgeX2afDe5wOIKX4fq70JQfRkmp1uDvv8c_jZd.TzUL1MzfgN7svBlU8nVv
 DMa07gWgTo13MWBlgHn9FYk8EZhDjUxibSQKCheEBxGWvFz.oe3iRzW2NptKOFMXz_WEBmWXBeL4
 QSKo2cJGj5mJN9B._ljo4YhrSd4gqjVgTb1Hjy66Z2hCXqJmzqUnfI5y99JIuKAx5.ZJ65Okd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sat, 23 Mar 2019 10:09:53 +0000
Date:   Sat, 23 Mar 2019 10:09:48 +0000 (UTC)
From:   Sgt Clara B Herbert <sgtclaraherbert@gmail.com>
Reply-To: Sgt Clara B Herbert <sgtclaraherbert@gmail.com>
Message-ID: <1775064503.9744627.1553335788957@mail.yahoo.com>
Subject: Hi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1775064503.9744627.1553335788957.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13212 YahooMailBasic Mozilla/5.0 (Windows NT 6.1; rv:57.0) Gecko/20100101 Firefox/57.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Greetings to you,

My name is Sgt Clara. America i am here to search for a business partner or friend who will help me to invest my fund in his company/country,Please reply me through my email:

Thanks
Sgt Clara
