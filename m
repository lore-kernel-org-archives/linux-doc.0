Return-Path: <SRS0=ymn6=A2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E67C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jul 2020 01:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A96F52072D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jul 2020 01:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgGOBDO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jul 2020 21:03:14 -0400
Received: from smtprelay0087.hostedemail.com ([216.40.44.87]:34298 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726187AbgGOBDM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jul 2020 21:03:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 281BE181D341E;
        Wed, 15 Jul 2020 01:03:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: rate98_1b17d2126ef5
X-Filterd-Recvd-Size: 3484
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Wed, 15 Jul 2020 01:03:10 +0000 (UTC)
Message-ID: <6ca9eee2cd8ea3b45b5d4b93bf177832c7def44d.camel@perches.com>
Subject: Odd style rst conversions of function prototypes?
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Date:   Tue, 14 Jul 2020 18:03:09 -0700
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel-doc output as html seems to use atypical kernel style
where the output does not use the typical kernel-style of
keeping the * next to the object.

Could that be changed so that the docs are output in the same
style as the code?

For example:

/**
 * dvb_module_probe - helper routine to probe an I2C module
 *
 * @module_name:
 *	Name of the I2C module to be probed
 * @name:
 *	Optional name for the I2C module. Used for debug purposes.
 * 	If %NULL, defaults to @module_name.
 * @adap:
 *	pointer to &struct i2c_adapter that describes the I2C adapter where
 *	the module will be bound.
 * @addr:
 *	I2C address of the adapter, in 7-bit notation.
 * @platform_data:
 *	Platform data to be passed to the I2C module probed.
 *
 * This function binds an I2C device into the DVB core. Should be used by
 * all drivers that use I2C bus to control the hardware. A module bound
 * with dvb_module_probe() should use dvb_module_release() to unbind.
 *
 * Return:
 *	On success, return an &struct i2c_client, pointing the the bound
 *	I2C device. %NULL otherwise.
 *
 * .. note::
 *
 *    In the past, DVB modules (mainly, frontends) were bound via dvb_attach()
 *    macro, with does an ugly hack, using I2C low level functions. Such
 *    usage is deprecated and will be removed soon. Instead, use this routine.
 */
struct i2c_client *dvb_module_probe(const char *module_name,
				    const char *name,
				    struct i2c_adapter *adap,
				    unsigned char addr,
				    void *platform_data);

where the kernel-doc html output is:

struct i2c_client * dvb_module_probe(const char * module_name, const char * name, struct i2c_adapter * adap, unsigned char addr, void * platform_data)

    helper routine to probe an I2C module

Parameters

const char * module_name
    Name of the I2C module to be probed
const char * name
    Optional name for the I2C module. Used for debug purposes. If NULL, defaults to module_name.
struct i2c_adapter * adap
    pointer to struct i2c_adapter that describes the I2C adapter where the module will be bound.
unsigned char addr
    I2C address of the adapter, in 7-bit notation.
void * platform_data
    Platform data to be passed to the I2C module probed.

Description

This function binds an I2C device into the DVB core. Should be used by all drivers that use I2C bus to control the hardware. A module bound with dvb_module_probe() should use dvb_module_release() to unbind.

Return

    On success, return an struct i2c_client, pointing the the bound I2C device. NULL otherwise.

Note

In the past, DVB modules (mainly, frontends) were bound via dvb_attach() macro, with does an ugly hack, using I2C low level functions. Such usage is deprecated and will be removed soon. Instead, use this routine.


